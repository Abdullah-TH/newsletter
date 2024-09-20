class Email < ApplicationRecord
  validates :subject, :body, presence: true
  belongs_to :template, optional: true

  def body_with_template
    template.nil? ? body : template.body.gsub("{{placeholder}}", body)
  end
end
