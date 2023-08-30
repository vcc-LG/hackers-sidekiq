require 'rails_helper'

RSpec.describe Survivor, type: :model do
  it "is valid with valid attributes" do
    group = Group.new(name: 'The Wasteland Wanderers', location: 'Desolate Plains')
    survivor = Survivor.new(name: 'Elena', health: 100, stamina: 80, hunger: 30, group: group)
    expect(survivor).to be_valid
  end
end
