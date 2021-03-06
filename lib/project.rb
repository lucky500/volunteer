class Project
  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i()
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end


  def self.find(id)
    found_project = nil
    Project.all().each() do |project|
      if project.id().==(id)
        found_project = project
      end
    end
    found_project
  end

  def volunteers
    list_volunteers = []
    volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{@id};")
    volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i()
      id = volunteer.fetch("id").to_i()
      list_volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    list_volunteers
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    @id = self.id
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id()};")
  end

  def ==(another_project)
    self.title().==(another_project.title()).&(self.id().==(another_project.id()))
  end
end
