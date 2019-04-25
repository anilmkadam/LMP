class HomeController < ApplicationController
    
    before_action :authenticate_user!

    def index    
        if !current_user.firstname
            flash[:alert] = "Please update your profile!"
            redirect_to edit_user_registration_path
        else
            @user = current_user
        end
        @leave = Leave.where('end_date > ?', Date.today).order('start_date asc').includes(:user)
        
    end  

    def history
        @leave = Leave.all.includes(:user)    
       
    end

    def add_user
        
    end
end