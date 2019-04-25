class LeaveController < ApplicationController
  before_action :authenticate_user!
    def index
 
    end

    def new
    end

    def create

      #@leave = Leave.create(leave_params.merge({status: 'pending',user_id: current_user.id}))
      @leave = current_user.leaves.create(leave_params.merge({status: 'pending'}))
      unless @leave.invalid?
        UserMailer.send_email(@leave).deliver_now
        flash[:notice] = "Leave successfully submitted."
        redirect_to root_path
      else
        flash[:alert] = @leave.errors.full_messages
        redirect_to root_path
      end
    end

    def edit
      @leave = Leave.find(params[:id]) 
          
    end

    def update
      @leave = Leave.find(params[:id]) 
      if update_params[:status] == 'approved'
        start_date = @leave.start_date
        end_date = @leave.end_date

        no_of_day = start_date.business_days_until(end_date)
        leave_count = User.find(@leave.user.id).leave_count  || 0

        leave_count = leave_count - no_of_day  
          
        if @leave.update(update_params)
          UserMailer.approve_leave_email(@leave).deliver_now
          flash[:notice] = "Leave successfully approved."
          User.find(@leave.user.id).update(leave_count: leave_count)
          render json: {success: true}
        else
          flash[:alert] = "Something went wrong"
          redirect_to root_path
        end        
      else
        if @leave.update(update_params)
          UserMailer.reject_leave_email(@leave).deliver_now
          flash[:notice] = "Leave successfully rejected."
          User.find(@leave.user.id).update(leave_count: leave_count)
          render json: {success: true}
        else
          flash[:alert] = "Something went wrong"
          redirect_to root_path
        end
      end    
    end

    def cancel_leave
      @leave = Leave.find(params[:id])
      if @leave.update(update_params)
        UserMailer.cancel_leave_email(@leave).deliver_now
        flash[:notice] = "Leave successfully canceled."
        render json: {success: true}
      else
        flash[:alert] = "Something went wrong"
        redirect_to history_leave_index_path
      end
    end

    def extend_leave 
      @leave = Leave.find(params[:id])
      current_end_date = @leave.end_date
      updated_end_date = extend_params[:end_date].to_date
      
      if(current_end_date < updated_end_date)
        no_of_days = current_end_date.business_days_until(updated_end_date) - @leave.user.leave_count
        @leave.update(extend_params)
        @leave.user.update(leave_count: no_of_days)
      else
        no_of_days = updated_end_date.business_days_until(current_end_date) + @leave.user.leave_count
        @leave.update(extend_params)
        @leave.user.update(leave_count: no_of_days)
      end      
      render json: {success: true}      
    end

    def history
      #e@leave = Leave.where('user_id = ?', current_user.id).includes(:user)
      @leave = current_user.leaves.all

      @leave_pending = @leave.where('status = ?',1)
      
      
      
    end

    private
    def leave_params
         params.permit(:leave_type,:subject,:description,:start_date,:end_date,:is_all_day,:start_time,:end_time,:email)
    end

    def update_params
      params.permit(:status)
    end

    def extend_params
      params.permit(:end_date)
    end
end
