# pull official base image
FROM python:3.9.0-slim-buster

# set working directory
WORKDIR /usr/src/app

# prevents Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1

# prevents python from buffering stdout and stderr
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update \
  && apt-get -y install netcat gcc postgresql \
  && apt-get clean

# add and install requirements
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app
COPY . .

# Add entrypoint.sh
COPY ./entrypoint.sh .
RUN chmod +x /usr/src/app/entrypoint.sh