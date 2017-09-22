class Volunteer
  attr_reader(:name)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    #@id = attributes.fetch(:id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = task.fetch("name")
      volunteers.push(Volunteer.new({:name => name}))
    end
    volunteers
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name())
  end
end
