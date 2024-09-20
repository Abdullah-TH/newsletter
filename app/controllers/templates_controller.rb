class TemplatesController < ApplicationController
  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    if @template.save
      redirect_to new_email_path
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @template = Template.find(params[:id])
  end

  def update
    @template = Template.find(params[:id])
    if @template.update(template_params)
      redirect_to new_email_path
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    redirect_to new_email_path
  end

  private

  def template_params
    params.require(:template).permit(:title, :body)
  end
end