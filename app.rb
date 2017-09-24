require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
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
  @project = Project.find(params.fetch("id").to_i())
  name = params.fetch("name")
  project_id = params.fetch("id").to_i()
  @volunteer = Volunteer.new({:name => name, :project_id => project_id, :id => nil})
  @volunteers = @project.volunteers()
  @volunteer.save()
  erb(:project)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch(:id).to_i)
  erb(:volunteer)
end

get('/projects/:id/edit') do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

patch('/projects/:id') do
  title = params.fetch('title')
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:title => title})
  erb(:project)
end
