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

post('/projects') do
  name = params.fetch("projectName")
  new_project = Project.new({:name => name, :id => nil})
  new_project.save
  @projects = Project.all
  erb(:projects)
end

get('/volunteers') do
  @volunteers = Volunteer.all
  erb(:volunteers)
end

get('/volunteers/add-volunteer') do

  erb(:add_volunteer)
end

# post('/volunteers') do
#   name = params.fetch("volunteerName")
#   project_id = params.fetch("project_id").to_i
#   @volunteer = Volunteer.new({:name => name, :project_id => project_id})
#   @volunteer.save
#   @project = Project.find(project_id)
#   erb(:volunteers)
# end
