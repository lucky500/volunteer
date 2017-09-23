require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
# require('./lib/item')
require('./lib/volunteer')
require('./lib/project')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get('/') do
  @projects = Project.all()
  erb(:index)
end

get('/projects/new') do
  erb(:project_list)
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
end


post('/') do
  title = params.fetch("title")
  project = Project.new({:title => title, :id => nil })
  project.save()
  @projects = Project.all()
  erb(:index)
end
