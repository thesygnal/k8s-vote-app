all: deploy

deploy:
    @echo "🚀 Deploying all application resources..."
    kubectl apply -f ./

clean:
    @echo "🔥 Deleting all application resources..."
    kubectl delete -f ./

inspect:
    @echo "🔍 Inspecting all deployed resources..."
    kubectl get all --selector=app

help:
    @echo "Available commands:"
    @echo "  make deploy  - Deploy all Kubernetes resources."
    @echo "  make clean   - Delete all deployed Kubernetes resources."
    @echo "  make inspect - Show the status of all deployed application pods and services."
    @echo "  make help    - Show this help message."

.PHONY: all deploy clean inspect help
