class TaskMailer < ApplicationMailer
    default from: 'bnaiemunah.mailer@gmail.com'
 
    def notify_task(user, task, current_user)
        @user = user
        @task = task
        @current_user = current_user
        mail(:to => @user.email, :subject => 'You have been assigned a new task' )
    end
end
