require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pg')
require('pry')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  erb(:index)
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

get('/projects/add-project') do
  erb(:add_project)
end

get('/projects/:id') do
  @volunteers = Volunteer.all
  @project = Project.find(params[:id].to_i)
  erb(:project)
end

post('/projects') do
  name = params.fetch("projectName")
  new_project = Project.new({:name => name, :id => nil})
  new_project.save
  @projects = Project.all
  erb(:projects)
end

post('/projects/:id') do
  name = params.fetch("volunteerName")
  project_id = params.fetch("id").to_i
  volunteer = Volunteer.new({:name => name, :project_id => project_id})
  volunteer.save
  @volunteers = Volunteer.all
  @project = Project.find(params[:id].to_i)
  erb(:project)
end

get('/projects/:id/update') do
  @volunteers = Volunteer.all
  @project = Project.find(params[:id].to_i)
  erb(:update_project)
end

patch('/projects/:id') do
  name = params[:projectName]
  @project = Project.find(params[:id].to_i)
  @project.update({:name => name})
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:project)
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  binding.pry
  @project.delete
  @projects = Project.all
  erb(:projects)
end

get('/volunteers') do
  @volunteers = Volunteer.all
  erb(:volunteers)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:project_id].to_i)
  erb(:volunteer)
end
