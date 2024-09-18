class Template < ApplicationRecord
  validates :title, presence: true
  validate :must_contain_placeholder

  private

  def must_contain_placeholder
    unless body.include?("{{placeholder}}")
      errors.add :body, "must contain {{placeholder}} somewhere in the template"
    end
  end
end
