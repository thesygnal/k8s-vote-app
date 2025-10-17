up:
	@echo "🚀 Starting all services in the background..."
	docker-compose up -d --build

down:
	@echo "🛑 Stopping and removing all services..."
	docker-compose down -v

build:
	@echo "🛠️  Building custom images (worker, vote, result)..."
	docker-compose build

logs:
	@echo "📜 Tailing logs from all services..."
	docker-compose logs -f

ps:
	@echo "📊 Checking service status..."
	docker-compose ps

clean:
	@echo "🧹 Cleaning up everything (containers, volumes, orphans)..."
	docker-compose down -v --remove-orphans

.PHONY: up down build logs ps clean
