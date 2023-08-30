class Survivor < ApplicationRecord
  belongs_to :group

  def start_scavenging(resource_id)
    ScavengeJob.perform_later(id, resource_id)
  end
end
