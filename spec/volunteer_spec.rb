require('rspec')
require('pg')
require('volunteer')
require('pry')

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM volunteers *;")
  end
end

describe("#==") do
  it("is the same task if it has the same description") do
    volunteer1 = Volunteer.new({:name => "John"})
    volunteer2 = Volunteer.new({:name => "John"})
    expect(volunteer1).to(eq(volunteer2))
  end
end
