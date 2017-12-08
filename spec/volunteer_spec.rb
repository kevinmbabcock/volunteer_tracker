require('spec_helper')

describe(Volunteer) do

  describe("#initialize") do
    it("creates a volunteer") do
      new_volunteer = Volunteer.new({:name => "Kevin", :id => nil})
      expect(new_volunteer).to(be_an_instance_of(Volunteer))
    end
  end



end
