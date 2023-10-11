class TestJob
  include Sidekiq::Worker

  def perform
    sleep 10
    # Your job's actual work here
  end
end
