import subprocess
import docker

# Define the file path for the Docker Compose YAML
docker_compose_file = 'jenkins-setup.yaml'

# Function to check if the Jenkins container is running
def is_jenkins_running():
    client = docker.from_env()
    try:
        jenkins_container = client.containers.get('jenkins')
        return jenkins_container.status == 'running'
    except docker.errors.NotFound:
        return False

try:
    if is_jenkins_running():
        # If Jenkins is already running, stop and remove the container
        print("Jenkins container is already running. Stopping and removing it...")
        subprocess.run(f'docker-compose -f {docker_compose_file} down', shell=True)

    # Run Docker Compose to start Jenkins as a new container
    subprocess.run(f'docker-compose -f {docker_compose_file} up -d', shell=True)
    
    print("Jenkins container is starting. Please wait...")
    
except Exception as e:
    print(f"An error occurred: {str(e)}")
finally:
    # No need to remove the Docker Compose file since it is named 'jenkins-setup.yaml'
    pass
