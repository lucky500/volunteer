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

post('/') do
  title = params.fetch("title")
  project = Project.new({:title => title, :id => nil })
  project.save()
  @projects = Project.all()
  erb(:index)
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

get('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project)
end

post('/projects/:id') do
  name = params.fetch("name")
  project_id = params.fetch("project_id").to_i()
  @project = Project.find(params.fetch("id").to_i())
  @volunteer = Volunteer.new({:name => name, :project_id => project_id})
  @volunteers = @project.volunteers()
  @volunteer.save()
  erb(:project)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch(:id).to_i)
  erb(:volunteer)
end

#
# get('/projects/:id/edit') do
#   @project = Project.find(params.fetch("id").to_i())
#   erb(:project_edit)
# end
