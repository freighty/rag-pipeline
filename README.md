# RAG Pipeline with LangChain and pgvector

A complete demonstration of a Retrieval-Augmented Generation (RAG) pipeline using **LangChain** and **pgvector**, packaged in a Docker Compose environment for easy deployment.

## Features
- **Interactive Notebooks**: Run and experiment directly from your browser.
- **PostgreSQL + pgvector**: Robust database with vector storage for semantic search.
- **Dockerized Environment**: One-command setup and deployment.
- **Customizable**: Inject your own API keys and endpoints.

## Prerequisites
- Docker
- Docker Compose V2

## Getting Started

1.  **Clone the repository** (if you haven't already).

2.  **Run the setup script**:
    This script will generate random credentials, create the necessary `.env` files, build the Docker images, and start the services.

    ```bash
    ./startup.sh
    ```

3.  **Access the services**:
    - **Jupyter Notebook**: Open your browser and navigate to the URL provided by the script (usually `http://localhost:8888`).
    - **PostgreSQL**: The database is accessible on port `5432`. Use the credentials generated during startup.

## Configuration

The `startup.sh` script automatically generates:
- **`.env`**: Contains a jupyter token and postgres password.
- **`notebooks/.env`**: Contains your API keys and endpoints.
