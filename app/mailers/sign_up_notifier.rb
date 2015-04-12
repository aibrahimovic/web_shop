class SignUpNotifier < ActionMailer::Base
  include SessionsHelper

  #default from: "test.atlant@gmail.com"

  #def registrated(user)
    #mail to: user.email
  #end

  def registrated(user)
    mail :subject => "abhShoes",
         :to      => user.email,
         :from    => "test.atlant@gmail.com"
  end

end
