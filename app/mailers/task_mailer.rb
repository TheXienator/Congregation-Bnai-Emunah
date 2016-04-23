class TaskMailer < ApplicationMailer
    default from: 'bnaiemunah.mailer@gmail.com'
 
    def notify_task(user, task, current_user)
        @user = user
        @task = task
        @current_user = current_user
        mail(:to => @user.email, :subject => 'You have been assigned a new task' )
    end
    
    def reset_password_instructions(user, token)
        @resource = user
        @token = token
        mail(:to => user.email,
        :subject => 'Password Reset Notification')
    end
end
