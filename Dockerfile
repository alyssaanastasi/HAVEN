FROM continuumio/miniconda3:latest

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc g++ libopenblas-dev liblapack-dev \
    pkg-config libhdf5-dev \
    && rm -rf /var/lib/apt/lists/*

COPY environment.yml /environment.yml

RUN conda env create -f /environment.yml