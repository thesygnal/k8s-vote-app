# 🗳️ K8s Vote App | A Kubernetes Voting Application

A project demonstrating two different methods for deploying the classic Docker example voting application: one using Docker Compose and the other using Kubernetes (with k3d). This repository is intended for learning and demonstration purposes.

## Table of Contents
- [Features](#features)
- [Folder Structure](#folder-structure)
- [Prerequisites](#prerequisites)
- [Installation and Usage](#installation-and-usage)
  - [Option 1: Deploying with Docker Compose](#option-1-deploying-with-docker-compose)
  - [Option 2: Deploying with Kubernetes (k3d)](#option-2-deploying-with-kubernetes-k3d)
- [Contributing](#contributing)
- [License](#license)

## Features

This application is composed of five main services:
* **Voting App**: A front-end web app in Python for casting votes.
* **Result App**: A front-end web app in Node.js for viewing vote results.
* **Redis**: An in-memory database that collects new votes.
* **PostgreSQL**: A persistent database where votes are stored.
* **Worker**: A .NET service that transfers votes from Redis to the PostgreSQL database.

## Folder Structure

The repository is organized into two main deployment methods:

-   `./containers/`: Contains all the files for the `docker-compose` deployment.
-   `./kubernetes/`: Contains all the Kubernetes manifests (`deployments`, `services`, `ingress`) for the k3d deployment.

## Prerequisites

Before you begin, ensure you have the following tools installed, depending on the deployment method you choose.

**For Docker Compose:**
* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/)

**For Kubernetes:**
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [k3d](https://k3d.io/v5.6.0/#installation)

## Installation and Usage

You can deploy the voting application using either Docker Compose or Kubernetes.

### Option 1: Deploying with Docker Compose

This method uses `docker-compose` to build and run all the application services locally.

1.  **Navigate to the containers directory:**
    ```bash
    cd containers
    ```

2.  **Start all services:**
    Use the `make up` command to build the images and start all containers in detached mode.
    ```bash
    make up
    ```

3.  **Access the applications:**
    * **Voting App**: Open your browser and go to [http://localhost:8001](http://localhost:8001)
    * **Result App**: Open your browser and go to [http://localhost:8002](http://localhost:8002)

4.  **Other useful commands:**
    The `Makefile` in the `containers` directory provides several commands to manage the application stack:
    * `make down`: Stop and remove all containers and volumes.
    * `make build`: Build the custom service images.
    * `make logs`: Tail the logs from all running services.
    * `make ps`: Check the status of the services.
    * `make clean`: Stop and remove everything, including orphaned containers.

### Option 2: Deploying with Kubernetes (k3d)

This method uses `k3d` to create a local Kubernetes cluster and deploys the application using `kubectl`.

1.  **Create the k3d cluster:**
    Run the provided script to create a new cluster named `vote-app-cluster` with the necessary ingress ports exposed.
    ```bash
    ./create-cluster.sh
    ```

2.  **Navigate to the Kubernetes directory:**
    ```bash
    cd kubernetes
    ```

3.  **Deploy the application:**
    Use the `make deploy` command to apply all the Kubernetes manifests (Deployments, Services, and Ingress).
    ```bash
    make deploy
    ```

4.  **Access the applications:**
    The services are exposed via an Ingress controller.
    * **Voting App**: Open your browser and go to [http://vote.127.0.0.1.nip.io](http://vote.127.0.0.1.nip.io)
    * **Result App**: Open your browser and go to [http://result.127.0.0.1.nip.io](http://result.127.0.0.1.nip.io)

5.  **Other useful commands:**
    The `Makefile` in the `kubernetes` directory provides commands to manage the deployment:
    * `make clean`: Delete all deployed Kubernetes resources (Deployments, Services, Ingress).
    * `make inspect`: Show the status of all application pods and services.
    * `make help`: Display a help message with all available commands.

## Contributing

Contributions are welcome! If you have suggestions for improvements, please feel free to fork the repository and submit a pull request.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## License

This project is unlicensed.
