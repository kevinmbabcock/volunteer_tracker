require('spec_helper')

describe(Volunteer) do

  describe("#initialize") do
    it("creates a volunteer") do
      new_volunteer = Volunteer.new({:name => "Kevin", :project_id => 1})
      expect(new_volunteer).to(be_an_instance_of(Volunteer))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Volunteer.all).to(eq([]))
    end
  end

  describe("#save") do
    it("correctly saves a volunteer to the database") do
      new_volunteer = Volunteer.new({:name => "Kevin", :project_id => 1})
      new_volunteer.save
      expect(Volunteer.all).to(eq([new_volunteer]))
    end
  end

  describe("#==") do
    it("evaluates volunteers as equal if they ahve the same name and project id") do
      new_volunteer1 = Volunteer.new({:name => "Kevin", :project_id => 1})
      new_volunteer1.save
      new_volunteer2 = Volunteer.new({:name => "Kevin", :project_id => 1})
      new_volunteer2.save
      expect(new_volunteer1).to(eq(new_volunteer2))
    end
  end



end
