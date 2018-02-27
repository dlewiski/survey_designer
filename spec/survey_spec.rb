require 'spec_helper'

describe('survey') do
  it("create new project") do
    test_survey = Survey.create({:name => "Post Epicodus"})
    expect(Survey.all).to(eq([test_survey]))
   end
end
