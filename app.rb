require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/survey')
require('./lib/question')
require('./lib/answer')
require('pry')
require('pg')


get('/') do
  @surveys = Survey.all
  erb:index
end

post('/') do
  @survey = Survey.create({:name => params[:name]})
  @surveys = Survey.all
  erb:index
end

get('/survey/:id') do
  surveys = Survey.all
  @answers = Answer.all
  id = params[:id].to_i
  @survey = (surveys.where(id: id)).first
  questions = Question.all
  @questions = (questions.where(survey_id: id))
  erb:survey_editor
end

# get('/question/:id') do
#   binding.pry
#   @questions = Question.all
#   @surveys = Survey.all
#   id = params[:id].to_i
#   question = (questions.where(id: id))
#   survey_id = question.survey_id
#   @survey = (surveys.where(id: survey_id)).first
#   erb:survey_editor
# end

post('/survey/:id') do
  surveys = Survey.all
  id = params[:id].to_i
  @survey = (surveys.where(id: id)).first
  questions = Question.all
  question = Question.create({:question => params["question"], :survey_id => id})
  @questions = (questions.where(survey_id: id))
  erb:survey_editor
end

delete('/survey/:id') do
  surveys = Survey.all
  id = params[:id].to_i
  @survey = (surveys.where(id: id)).first
  @survey.destroy
  @surveys = Survey.all
  erb:index
end

delete('/question/:id') do
  questions = Question.all
  @surveys = Survey.all
  id = params[:id].to_i
  question = (questions.where(id: id))
  survey_id = question.survey_id
  @survey = (surveys.where(id: survey_id)).first
  @question = (questions.where(id: id)).first
  @question.destroy
  @questions = Question.all
  erb:survey_editor
end
