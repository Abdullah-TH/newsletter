class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
    @email = Email.new
    @templates = Template.all
  end

  def create
    @email = Email.new(email_params)
    if @email.save
      Subscriber.all.each do |subscriber|
        NewsletterMailer.email(subscriber, @email).deliver_now
      end
      redirect_to emails_path, notice: "Email Sent"
    else
      render "new", status: :unprocessable_content
    end
  end

  private

  def email_params
    params.require(:email).permit(:subject, :body, :template_id)
  end
end
