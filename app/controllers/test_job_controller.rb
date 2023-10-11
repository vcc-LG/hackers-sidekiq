class TestJobController < ApplicationController
  def create
    TestJob.perform_async
    redirect_to '/', notice: "Test job has been enqueued."
  end
end
