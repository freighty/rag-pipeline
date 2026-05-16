#!/bin/bash

if [ ! -f .env ]; then
    echo "Generating randomized credentials..."
    JUPYTER_TOKEN=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 10)
    POSTGRES_PASSWORD=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 10)
    cat << EOF > .env
JUPYTER_TOKEN=$JUPYTER_TOKEN
POSTGRES_PASSWORD=$POSTGRES_PASSWORD
EOF
fi


if [ ! -f notebooks/.env ]; then
    echo "No .env file found in notebooks folder."
    echo "Please enter your API endpoint:"
    read ENDPOINT
    echo "Please enter your API key:"
    read API_KEY
    cat << EOF > notebooks/.env
API_ENDPOINT=$ENDPOINT
API_KEY=$API_KEY
POSTGRES_PASSWORD=$POSTGRES_PASSWORD
EOF
fi

source .env

echo "Building and starting services..."
docker compose up -d --build

echo "Jupyter Token: http://localhost:8888/?token=$JUPYTER_TOKEN"
echo "Postgres Connection String: postgresql://postgres:$POSTGRES_PASSWORD@localhost:5432/vectordb"

