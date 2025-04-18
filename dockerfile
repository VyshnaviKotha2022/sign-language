# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Install system dependencies for tkinter, OpenCV, and GLib
RUN apt-get update && apt-get install -y \
    python3-tk \
    libgl1 \
    libglib2.0-0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port that the application runs on (if applicable)
EXPOSE 8000

# Command to run the application
CMD ["python", "predict_real_time.py"]
