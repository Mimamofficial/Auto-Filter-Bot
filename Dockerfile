FROM python:3.11

WORKDIR /Auto-Filter-Bot

COPY . /Auto-Filter-Bot

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip --root-user-action=ignore && \
    pip install --no-cache-dir -r requirements.txt --root-user-action=ignore

CMD ["python", "bot.py"]
