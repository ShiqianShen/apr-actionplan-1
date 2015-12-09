class AprMailer < ApplicationMailer
  default from: 'apr@unm.edu'

  def apr_submit_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Submitted Action Plan')
  end
end
