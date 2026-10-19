FROM nikolaik/python-nodejs:python3.10-nodejs20

WORKDIR /app

# Install FFmpeg using apt
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg ca-certificates && rm -rf /var/lib/apt/lists/*

# Copy application files
COPY . /app/

# Install Python dependencies
RUN python -m pip install --no-cache-dir --upgrade pip && python -m pip install --no-cache-dir -r requirements.txt

# Verify FFmpeg
RUN ffmpeg -version

# Start application
CMD ["bash", "start"]
