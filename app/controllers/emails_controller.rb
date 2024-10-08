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
      @templates = Template.all
      render "new", status: :unprocessable_content
    end
  end

  private

  def email_params
    result = params.require(:email).permit(:subject, :body, :template_id)
    result.tap do |params|
      params[:template_id] = params[:template_id].presence
    end
  end
end
