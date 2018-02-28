class Answer < ActiveRecord::Base
  validates(:answer, {:presence => true})
  before_save(:capitalize_string)

  belongs_to(:question)

  private

  def capitalize_string
    self.answer=(answer().capitalize)
  end
end
