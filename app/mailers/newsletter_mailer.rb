class NewsletterMailer < ApplicationMailer
  def email(subscriber, email)
    subscriber = subscriber
    email = email
    body = email.template.nil? ? email.body : email.template.body.gsub("{{ placeholder }}", email.body)
    mail to: subscriber.email, subject: email.subject, body: body
  end
end
