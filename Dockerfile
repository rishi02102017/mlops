FROM python:3.9-slim  # Base image

WORKDIR /workspace  # Set the working directory inside the container

COPY . .  # Copy all files from the project directory into the container

RUN apt-get update && apt-get install -y \  # Install necessary system dependencies
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

RUN pip install --no-cache-dir -r requirements.txt  # Install Python dependencies

EXPOSE 80  # Expose port 80 (optional for web services)

ENV NAME MLOpsLab  # Set environment variables

CMD ["python", "train.py"]  # Command to run when container starts (train.py script)
