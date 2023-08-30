require 'rails_helper'

RSpec.describe ScavengeJob, type: :job do
  it "decreases the amount of the resource" do
    group = create(:group)
    resource = create(:resource, difficulty: 3, amount: 50)
    survivor = create(:survivor, hunger: 30, group: group)

    ScavengeJob.perform_now(survivor_id: survivor.id, resource_id: resource.id)

    resource.reload

    expect(resource.amount).to be < 50
  end
end
