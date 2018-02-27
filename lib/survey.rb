class Survey < ActiveRecord::Base
  validates(:name, {:presence => true})
  before_save(:capitalize_name)

  private

  def capitalize_name
    self.name=(name().capitalize)
  end
end
