require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# Your project should be set up so that a volunteer can only be created if a project already exists. (This makes it easier to assign the one to many relationship in Sinatra.) Focus on getting one integration spec passing at a time.

# The user should be able to visit the home page and fill out a form to add a new project. When that project is created, the application should direct them back to the homepage.

# describe('adding a new project', {:type => :feature}) do
#   it('allows a user to click a project to see the voluneers and details for it') do
#     visit('/')
#     click_link('Add new Project')
#     fill_in('title', :with => 'Teaching Kids to Code')
#     click_button('Create Project')
#     expect(page).to have_content('Success!')
#   end
# end

describe 'the project creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    fill_in('title', :with => 'Teaching Kids to Code')
    click_button('Create Project')
    expect(page).to have_content('Teaching Kids to Code')
  end
end

# describe('viewing all the projects', {:type => :feature}) do
#   it('allows adm to see all the projects that were created') do
#     test_project = Project.new({:title => 'Teaching Kids to Code'})
#     test_project.save()
#     visit('/')
#     click_button('View all Projects')
#     expect(page).to have_content(project.name)
#   end
# end



# The user should be able to click on a project detail page and see a list of all volunteers working on that project. The user should be able to click on a volunteer to see the volunteer's detail page.

# describe 'the volunteer detail page path', {:type => :feature} do
#   it 'shows a volunteer detail page' do
#     test_project = Project.new({:title => 'Teaching Kids to Code', :id => nil})
#     test_project.save
#     project_id = test_project.id.to_i
#     test_volunteer = Volunteer.new({:name => 'Jasmine', :project_id => project_id, :id => nil})
#     test_volunteer.save
#     visit "/projects/#{project_id}"
#     click_link('Jasmine')
#     fill_in('name', :with => 'Jane')
#     click_button('Update Volunteer')
#     expect(page).to have_content('Jane')
#   end
# end
