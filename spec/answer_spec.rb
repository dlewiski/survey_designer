require 'spec_helper'

describe('answer') do
  it("creates a new answer series") do
    test_answer = Answer.create({:answer => "As much as possible"})
    expect(Answer.all).to(eq([test_answer]))
   end

  describe('#validate') do
    it("determines if anything is entered in the answer string") do
    test_answer = Answer.create({:answer => ""})
      expect(test_answer.save).to(eq(false))
    end
  end

  describe('#capitalize_answer') do
    it("capitalizes the answer") do
      test_answer = Answer.create({:answer => "as much as possible"})
      expect(test_answer.answer).to(eq("As much as possible"))
    end
  end

  describe('#find_question') do
    it("returns the question within which the answer belongs") do
      test_question = Question.create({:question => "What is the best part of being alive?"})
      test_answer = Answer.create({:answer => "Epicodus Surveys", :question_id => test_question.id})
      expect(test_answer.question()).to(eq(test_question))
    end
  end
end
