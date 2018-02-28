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
  erb:index
end


post('/') do
  erb:index
end


get('/survey/:id')
  erb:survey_editor
end


patch('/surveys/:id/edit')
  erb:survey_editor
end


patch('/questions/:id/edit')
  erb:survey_editor
end


post('/surveys/:id/add_question')

  erb:survey_editor
end


post('/questions/:id/add_answer')
  .create
  erb:survey_editor
end


delete('/surveys/:id/delete')
  .delete
  erb:survey_editor
end


delete('/questions/:id/delete')
  .delete
  erb:survey_editor
end


delete('/questions/:id/delete_answers')
  .delete
  erb:survey_editor
end
