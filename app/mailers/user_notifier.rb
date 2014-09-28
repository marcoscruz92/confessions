class UserNotifier < ActionMailer::Base
  default from: "marcos.cruz3@upr.edu"

  def send_signup_email(user)
  	@user = user
  	mail( :to => @user.email,
  		  :subject => "Thanks for Signin up to Confessions!!")
  end
end
