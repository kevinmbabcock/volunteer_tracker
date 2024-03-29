class Volunteer
  attr_reader(:name, :project_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("project_id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => id}))
    end
    volunteers
  end

  def save
    DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', '#{@project_id}');")
  end

  def ==(other_volunteer)
    self.name.==(other_volunteer.name).&(self.project_id.==(other_volunteer.project_id))
  end

  # def self.find(id)
  #   found_volunteer = nil
  #   Volunteer.all.each do |volunteer|
  #     if volunteer.

end
