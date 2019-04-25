class RegistrationController < ApplicationController
  # before_action :authenticate_user!
    def new
    if current_user.role == "admin"
        @user = User.new
      else
        redirect_to root_path
      end
    end
    
    def create
      
        @user = User.create(user_params.merge({leave_count: 0}))
        unless @user.invalid?
          flash[:notice] = "User created."
          redirect_to root_path
        else
          flash[:alert] = "Account is not created Error => #{@user.errors.full_messages}"
          redirect_to new_registration_path
        end
        
    end

    def change_role
      @user = User.where("email = ?",role_params[:email])
      
      if @user.update(role_params)
        flash[:notice] = "User Updated."
        redirect_to root_path
      else
        flash[:alert] = "Account is not updated"
        redirect_to new_registration_path
      end
      
    end

    def show
        
    end

    private

    def user_params
        params.permit(:email, :password, :role)
    end

    def role_params
      params.permit(:email,:role)
    end
end
