all: deploy

deploy:
	kubectl apply -f ./deployments
	kubectl apply -f ./services
	kubectl apply -f ./ingress

clean:	
	kubectl delete -f ./deployments
	kubectl delete -f ./services
	kubectl delete -f ./ingress

inspect:
	kubectl get all --selector=app

help:
	@echo "  make deploy  - Deploy all Kubernetes resources."
	@echo "  make clean   - Delete all deployed Kubernetes resources."
	@echo "  make inspect - Show the status of all deployed application pods and services."
	@echo "  make help    - Show this help message."

.PHONY: all deploy clean inspect help
