class Email < ApplicationRecord
  validates :subject, :body, presence: true
  belongs_to :template, optional: true
end
