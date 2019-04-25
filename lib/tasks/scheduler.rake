namespace :scheduler do
  desc "TODO"
  task add_leave: :environment do
    p 'Updating leaves count'
    User.update_all("leave_count = leave_count + 1.75")
    p 'Done'

  end

end
