require 'spec_helper'

describe('survey') do
  it("create new project") do
    test_survey = Survey.create({:name => "Post Epicodus"})
    expect(Survey.all).to(eq([test_survey]))
   end

  describe('#validate') do
    it("determines if anything is entered in the survey name") do
      test_survey = Survey.new({:name => ""})
      expect(test_survey.save).to(eq(false))
    end
  end

  describe('#capitalize_name') do
    it("capitalizes the name of the survey") do
      test_survey = Survey.create({:name => "pony starfield"})
      expect(test_survey.name).to(eq("Pony Starfield"))
    end
  end
end
