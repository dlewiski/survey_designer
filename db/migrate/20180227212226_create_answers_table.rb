class CreateAnswersTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:answers) do |t|
      t.column(:answer, :string)
      t.column(:question_id, :integer)
      t.column(:survey_id, :integer)
      t.column(:counter, :integer)

      t.timestamps
    end
  end
end
