from locust import HttpUser, between, task


class MyLocustUser(HttpUser):
    wait_time = between(1, 5)  # Set the time between requests (in seconds)

    @task
    def my_task(self):
        self.client.get("/")
