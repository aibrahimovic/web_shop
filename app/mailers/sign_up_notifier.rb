class SignUpNotifier < ActionMailer::Base
  include SessionsHelper

  default from: "email_neki" #"aazraa.ibrahimovic@gmail.com"

  def registrated(user)
    mail to: user.email
  end
end
