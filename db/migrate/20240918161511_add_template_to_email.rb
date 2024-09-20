class AddTemplateToEmail < ActiveRecord::Migration[7.2]
  def change
    add_reference :emails, :template, foreign_key: true, type: :integer
  end
end
