require('spec_helper')

describe(Project) do

  describe("#initialize") do
    it("create a new project") do
      new_project = Project.new({:name => "project1", :id => nil})
      expect(new_project).to(be_an_instance_of(Project))
    end
  end


end
