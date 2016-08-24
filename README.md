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
CHE_HOST=141.142.xxx.xxx
docker run --name=che -it --rm -p 8080:8080 -p 8000:8000 -p 32768-65535:32768-65535 --privileged -e CHE_HOST=${CHE_HOST} ndslabs/che:dind
```

NOTE: Make sure to substitute in the host / port you plan to use to access the UI.

## Access
You should then be able to navigate your browser to `http://${CHE_HOST}:8080` to start using Che:
```bash
curl -L ${CHE_HOST}:8080
```

# Create a Workspace
Creates a workspace
`http://${CHE_HOST}:8080/dashboard/#/create-workspace`

# Create a Project
Creates a workspace and a project
`http://${CHE_HOST}:8080/dashboard/#/create-project`

# Standalone Observations
* Closely resembles the "Codenvy Beta" interface
* No "factories"
* Does debug actually work?
* Requires exposing Docker NodePorts (32768-65535)
