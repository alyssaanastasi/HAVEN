FROM python:3.12-slim

# Create virtual environment
RUN mkdir /venv && \
    python -m venv /venv/docker_haven && \
    chmod -R 777 /venv/docker_haven

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc g++ libopenblas-dev liblapack-dev \
    pkg-config libhdf5-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages into virtual environment
COPY requirements.txt /app/requirements.txt
RUN /bin/bash -c "source /venv/docker_haven/bin/activate && \
    pip install --upgrade pip setuptools wheel Cython && \
    pip install --no-cache-dir -r /app/requirements.txt" 