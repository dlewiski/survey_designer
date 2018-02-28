require 'spec_helper'

describe('question') do
  it("creates a new question") do
    test_question = Question.create({:question => "What is your desired salary?"})
    expect(Question.all).to(eq([test_question]))
   end

  describe('#validate') do
    it("determines if anything is entered in the question string") do
      test_question = Question.create({:question => ""})
      expect(test_question.save).to(eq(false))
    end
  end

  describe('#capitalize_name') do
    it("capitalizes the name of the survey") do
      test_question = Question.create({:question => "what is your desired salary?"})
      expect(test_question.question).to(eq("What is your desired salary?"))
    end
  end

  describe('#find_survey') do
    it("returns the survey within which the question belongs") do
      test_survey = Survey.create({:name => "Epicodus Survey"})
      test_question = Question.create({:question => "what is your desired salary?", :survey_id => test_survey.id})
      expect(test_question.survey()).to(eq(test_survey))
    end
  end
end
