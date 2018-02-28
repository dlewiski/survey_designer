class Question < ActiveRecord::Base
  validates(:question, {:presence => true})
  before_save(:capitalize_string)

  belongs_to(:survey)

  private

  def capitalize_string
    self.question=(question().capitalize)
  end
end
