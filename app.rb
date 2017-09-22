require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
# require('./lib/item')
require('./lib/volunteer')
require('./lib/project')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get('/') do
  erb(:index)
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

get('/projects/new') do
  erb(:project_list)
end

# post('/projects') do
#   title = params.fetch("title")
#   project = Project.new({:title => title, :id => nil })
#   project.save()
#   erb(:project_success)
# end
