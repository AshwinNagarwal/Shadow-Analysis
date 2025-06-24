# Use official Python image
FROM python:3.10-slim

# Install system dependencies for OpenCV & MediaPipe
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Set env variable so Flask knows the port
ENV PORT=8000

# Expose that port to the web
EXPOSE 8000

# Run the app
CMD ["python", "flask_app.py"]
