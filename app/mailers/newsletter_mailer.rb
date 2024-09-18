class NewsletterMailer < ApplicationMailer
  def email(subscriber, email)
    subscriber = subscriber
    email = email
    body = email.template.nil? ? email.body : email.template.body.gsub("{{placeholder}}", email.body)
    mail to: subscriber.email,
         subject: email.subject,
         content_type: "text/html",
         body: body
  end
end
