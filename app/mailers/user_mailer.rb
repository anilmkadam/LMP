class UserMailer < ApplicationMailer
default from: 'anil1841997@gmail.com'
 
  def send_email(leave)
    @leave = leave
    mail(to: @leave.email, subject: 'Request to leave')
  end

  def cancel_leave_email(leave)
    @leave = leave
    mail(to: @leave.email, subject: 'Leave Canceled by user')
  end

  def approve_leave_email(leave)
    @leave = leave
    @email = User.find(@leave.user_id).email
    mail(to: @email, subject: 'Leave approved by Admin')
  end

  def reject_leave_email(leave)
    @leave = leave
    @email = User.find(@leave.user_id).email
    mail(to: @email, subject: 'Leave rejected by Admin')
  end

end
