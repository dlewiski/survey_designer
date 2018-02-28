class CreateSurveyTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |t|
      t.column(:name, :string)
      t.column(:question_id, :integer)

      t.timestamps
    end
  end
end
