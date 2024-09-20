class NewsletterMailer < ApplicationMailer
  def email(subscriber, email)
    subscriber = subscriber
    email = email
    body = email.body_with_template
    mail to: subscriber.email,
         subject: email.subject,
         content_type: "text/html",
         body: body
  end
end
