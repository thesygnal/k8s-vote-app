# 🗳️ K8s Vote App | A Kubernetes Voting Application

## 🚀 Overview

This project is a Kubernetes-native deployment of the classic Docker voting application. Its primary goal is to serve as a practical, hands-on example of converting a `docker-compose` project into a robust Kubernetes environment suitable for local development and staging.

The application is composed of five distinct microservices:
1.  **Voting App (Frontend):** A Python web app for casting votes.
2.  **Result App (Frontend):** A Node.js web app that displays live voting results.
3.  **Worker:** A .NET service that processes votes from a Redis queue and persists them to a PostgreSQL database.
4.  **Redis:** A key-value store used as a message queue for incoming votes.
5.  **PostgreSQL:** A relational database for persistent storage of vote data.

## 🛠️ Architecture & Concepts Demonstrated

This deployment leverages core Kubernetes concepts to ensure a scalable and resilient architecture:

* **Deployments:** Used for the **stateless** services (`voting-app`, `result-app`, `worker`) to enable easy scaling and rolling updates.
* **Services (`ClusterIP` & `NodePort`):** Internal services (`redis`, `db`) use `ClusterIP` for secure, in-cluster communication. Frontend services use `NodePort` for simple external access during development, with Ingress being the recommended next step.
* **Ingress:** The setup is designed to be easily fronted by an Ingress controller (like NGINX or Traefik) to manage external traffic via hostnames (e.g., `vote.example.com`).
* **Resource Management:** All deployments include CPU and memory `requests` and `limits` to ensure predictable performance and stable node operation.
* **Configuration as Code:** All Kubernetes objects are defined declaratively in YAML manifests, enabling version control and repeatable deployments.

## ⚙️ Getting Started

### Prerequisites
* A running Kubernetes cluster (e.g., `k3d`, `minikube`, `Docker Desktop`).
* `kubectl` configured to connect to your cluster.
* `make` (optional, for using the Makefile shortcuts).

### Deployment Steps

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/thesygnal/k8s-vote-app.git
    cd k8s-vote-app
    ```
2.  **Navigate to kubernetes folder**
    ```bash
    cd kubernetes
    ```

3.  **Deploy the application:**
    You can use the provided `Makefile` for convenience.
    ```bash
    make deploy
    ```
    Alternatively, apply the manifests directly with `kubectl`:
    ```bash
    kubectl apply -f kubernetes/
    ```
    This command will create all necessary Deployments, Services, and other resources.

4.  **Inspect the deployment:**
    To check the status of all created resources, run:
    ```bash
    make inspect
    ```
    Or:
    ```bash
    kubectl get all --selector=app
    ```
    Wait until all pods are in the `Running` state and `1/1` in the `READY` column.

## 🌐 Accessing the Application

The frontend services are exposed via `NodePort`.

1.  **Find your Node's IP and the services' ports:**
    ```bash
    # For k3d or other multi-node setups
    kubectl get nodes -o wide

    # For minikube
    minikube ip
    ```
    Then, find the assigned `NodePort` for each service:
    ```bash
    kubectl get svc voting-app result-app
    ```
    Look for the port mapping in the `PORT(S)` column (e.g., `8001:31001/TCP`).

2.  **Access the web interfaces:**
    Open your browser and navigate to:
    * **Voting App:** `http://<NODE_IP>:<VOTING_APP_NODE_PORT>`
    * **Result App:** `http://<NODE_IP>:<RESULT_APP_NODE_PORT>`

## 🧹 Cleanup

To delete all the resources created by this project, run:
```bash
make clean
```
