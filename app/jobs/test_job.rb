class TestJob
  include Sidekiq::Worker

  def perform
    sleep 5
    # Your job's actual work here
  end
end
