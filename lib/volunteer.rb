class Volunteer
  attr_reader(:name)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    #@id = attributes.fetch(:id)
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name())
  end
end
