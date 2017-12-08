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




end
