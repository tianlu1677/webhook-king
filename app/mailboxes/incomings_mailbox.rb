class IncomingsMailbox < ApplicationMailbox
  before_processing :ensure_user

  def process
    return if user.nil?
    mail_attachments
  end

  def mail_body
    mail.body.decoded
  end

  def mail_attachments
    mail.attachments.each do |attachment|
      # your logic here
    end
  end

  private
  
  def user
    @user = User.find_by(email: mail.from)
  end

  def ensure_user
    user
    # send email back if user is not found in the db make sure to send us an email from an account that does exist
    bounce_with InviteMailer.missing_user(mail.from) if @user.nil?
  end
end
