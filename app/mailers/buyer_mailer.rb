class BuyerMailer < ApplicationMailer

  def welcome_mail(user)

    @user = user

    @subject = 'Welcome!'

    recipients = []

    # emailova adresa uzivatele
    recipients << user.email

    mail(to: recipients, subject: 'Welcome!')

    @user.update_attribute(:password_temp, nil) # reset temporary password


  end


end
