#!/bin/bash

# Colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}ApiAgenda Docker Setup${NC}"
echo "=============================="

# Function to check if Docker is installed
check_docker() {
  if ! command -v docker &> /dev/null; then
    echo -e "${RED}Docker is not installed. Please install Docker first.${NC}"
    exit 1
  fi

  if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}Docker Compose is not installed. Please install Docker Compose first.${NC}"
    exit 1
  fi
}

# Function to build and start containers
start_containers() {
  echo -e "${YELLOW}Building and starting containers...${NC}"
  docker-compose up -d --build
  
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}Containers started successfully!${NC}"
    echo -e "${GREEN}API is available at: http://localhost:8080${NC}"
    echo -e "${GREEN}SQL Server is available at: localhost:1433${NC}"
    echo -e "${GREEN}SQL Server credentials: User=sa, Password=YourStrong@Passw0rd${NC}"
  else
    echo -e "${RED}Failed to start containers.${NC}"
  fi
}

# Function to stop containers
stop_containers() {
  echo -e "${YELLOW}Stopping containers...${NC}"
  docker-compose down
  
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}Containers stopped successfully!${NC}"
  else
    echo -e "${RED}Failed to stop containers.${NC}"
  fi
}

# Function to show container status
show_status() {
  echo -e "${YELLOW}Container status:${NC}"
  docker-compose ps
}

# Function to show logs
show_logs() {
  echo -e "${YELLOW}Container logs:${NC}"
  docker-compose logs
}

# Main script
check_docker

case "$1" in
  start)
    start_containers
    ;;
  stop)
    stop_containers
    ;;
  restart)
    stop_containers
    start_containers
    ;;
  status)
    show_status
    ;;
  logs)
    show_logs
    ;;
  *)
    echo -e "${YELLOW}Usage:${NC} $0 {start|stop|restart|status|logs}"
    exit 1
esac

exit 0