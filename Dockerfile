FROM nikolaik/python-nodejs:python3.10-nodejs20

RUN apt-get update && 
    apt-get install -y --no-install-recommends 
        ffmpeg 
        ca-certificates && 
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app/

RUN python -m pip install --no-cache-dir --upgrade pip && 
    python -m pip install --no-cache-dir -r requirements.txt

RUN ffmpeg -version

CMD ["bash", "start"]
