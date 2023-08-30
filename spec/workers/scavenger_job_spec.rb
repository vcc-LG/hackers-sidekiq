require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe ScavengerJob, type: :worker do
  it 'performs the scavenging job successfully' do
    Sidekiq::Testing.fake! # Use fake testing mode for Sidekiq

    group = create(:group)
    resource = create(:resource, difficulty: 3, amount: 50)
    survivor = create(:survivor, hunger: 30, group: group)

    expect {
      ScavengerJob.perform_async(survivor.id, resource.id)
    }.to change(ScavengerJob.jobs, :size).by(1)
  end
end
