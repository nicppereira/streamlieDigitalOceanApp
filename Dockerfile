# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app


# Install git (needed to clone the repository)
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://github.com/nicppereira/streamlieDigitalOceanApp.git /app

# Install required packages
RUN pip3 install -r requirements.txt

# Expose the port Streamlit runs on
EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0"]