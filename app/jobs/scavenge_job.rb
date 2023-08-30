class ScavengeJob < ApplicationJob
  queue_as :default

  def perform(survivor_id:, resource_id:)
    survivor = Survivor.find(survivor_id)
    resource = Resource.find(resource_id)

    scavenging_time = calculate_scavenging_time(resource.difficulty)
    sleep(scavenging_time) # Simulate scavenging time
    resource.update(amount: 1)

    # if rand(1..10) <= resource.difficulty
    #   # Random chance to fail based on resource difficulty
    #   puts "Scavenging for #{resource.name} failed!"
    #   # You can raise an error here if desired
    # else
    #   scavenged_amount = rand(1..10)
    #   resource.update(amount: [resource.amount - scavenged_amount, 0].max)
    # end
  end

  private

  def calculate_scavenging_time(difficulty)
    # Define a formula to determine scavenging time based on difficulty
    # You can adjust this formula based on your game's pace
    base_time = 3 # Base scavenging time
    scavenging_time = base_time + (difficulty * 1.5) # Adjusted based on difficulty
    scavenging_time
  end
end
