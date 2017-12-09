require('spec_helper')

describe(Project) do

  describe("#initialize") do
    it("create a new project") do
      new_project = Project.new({:name => "project1", :id => nil})
      expect(new_project).to(be_an_instance_of(Project))
    end
  end

  describe(".all") do
    it("is empty in the beginning") do
      expect(Project.all).to(eq([]))
    end
  end

  describe("#save") do
    it("correctly saves a new project to the database") do
      new_project = Project.new({:name => "project1", :id => nil})
      new_project.save
      expect(Project.all).to(eq([new_project]))
    end
  end

  describe("#==") do
    it("evaluates projects as equal if they have the same name") do
      new_project1 = Project.new({:name => "my_project", :id => nil})
      new_project2 = Project.new({:name => "my_project", :id => nil})
      expect(new_project1).to(eq(new_project2))
    end
  end

  describe(".find") do
    it("returns a project by its ID") do
      new_project1 = Project.new({:name => "project1", :id => nil})
      new_project1.save
      new_project2 = Project.new({:name => "project 2", :id => nil})
      new_project2.save
      expect(Project.find(new_project2.id)).to(eq(new_project2))
    end
  end

  describe("#update") do
    it("lets you update a list in a database") do
      new_project = Project.new({:name => "project1", :id => nil})
      new_project.save
      new_project.update({:name => "project2", :id => nil})
      expect(new_project.name).to(eq("project2"))
    end
  end

  describe("#delete") do
    it("allows you to delete a project from the database") do
      new_project1 = Project.new({:name => "project1", :id => nil})
      new_project1.save
      new_project2 = Project.new({:name => "project2", :id => nil})
      new_project2.save
      new_project1.delete
      expect(Project.all).to(eq([new_project2]))
    end
  end

end
