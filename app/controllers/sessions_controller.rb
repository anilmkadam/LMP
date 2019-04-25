class SessionsController < Devise::SessionsController
    # skip_before_filter :session_expiry, only: [:create, :destroy, :new]
    # skip_before_filter :update_activity_time, only: [:destroy, :new]
    layout "logged_out_application"
    def create
        super
        flash[:notice] = nil
      end
      def destroy
        super
        flash[:notice] = nil
      end
end