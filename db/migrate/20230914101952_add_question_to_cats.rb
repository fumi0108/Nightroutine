class AddQuestionToCats < ActiveRecord::Migration[6.1]
  def change
    add_column :cats, :question, :string
  end
end
