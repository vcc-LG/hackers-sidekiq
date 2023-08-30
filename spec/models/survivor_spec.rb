require 'rails_helper'
require 'active_job/test_helper'

RSpec.describe Survivor, type: :model do
  it "is valid with valid attributes" do
    group = Group.new(name: 'The Wasteland Wanderers', location: 'Desolate Plains')
    survivor = Survivor.new(name: 'Elena', health: 100, stamina: 80, hunger: 30, group: group)
    expect(survivor).to be_valid
  end

  describe "#start_scavenging" do
    it "enqueues an instance of ScavengeJob" do
      group = create(:group)
      resource = create(:resource, difficulty: 3, amount: 50)
      survivor = create(:survivor, hunger: 30, group: group)

      expect {
        survivor.start_scavenging(resource.id)
      }.to have_enqueued_job(ScavengeJob).with(survivor.id, resource.id)
    end

    it "decreases the amount of the resource" do
      group = create(:group)
      resource = create(:resource, difficulty: 3, amount: 50)
      survivor = create(:survivor, hunger: 30, group: group)

      survivor.start_scavenging(resource.id)

      expect(resource.amount).to be < 50
    end
  end
end
