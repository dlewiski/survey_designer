RSpec.configure do |config|
  config.after(:each) do
   Task.all().each() do |task|
  task.destroy()
      end
  end
end