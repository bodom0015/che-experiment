# che-experiment
This repository contains experimental methods of running Eclipse Che via Docker.

# Getting Started
Prerequisites:
* Git installed
* Docker installed

## Clone
Clone this repository to your local machine:
```bash
git clone https://github.com/bodom0015/che-experiment.git
```

## Build
Build the Eclipse Che Docker-in-Docker image:
```bash
docker build -t ndslabs/che:dind .
```

## Run
Run your newly built image using the following command:
```bash
CHE_HOST=localhost
CHE_PORT=8080
docker run --name=che -it --rm --net=host --privileged -e CHE_HOST=${CHE_HOST} -e CHE_PORT=${CHE_PORT} ndslabs/che:dind
```

NOTE: Make sure to substitute in the host / port you plan to use to access the UI.

## Access
You should then be able to navigate your browser to `http://${CHE_HOST}:${CHE_PORT}` to start using Che:
```bash
curl -L ${CHE_HOST}:${CHE_PORT}
```

# Create a Workspace
Creates a workspace
`http://localhost:8080/dashboard/#/create-workspace`

# Create a Project
Creates a workspace and a project
`http://localhost:8080/dashboard/#/create-project`

# Standalone Observations
* Closely resembles the "Codenvy Beta" interface
* No "factories"
