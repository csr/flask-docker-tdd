# pull official base image
FROM python:3.9.0-slim-buster

# set working directory
WORKDIR /usr/src/app

# prevents Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1

# prevents python from buffering stdout and stderr
ENV PYTHONUNBUFFERED 1

# add and install requirements
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app
COPY . .

# run server
CMD python manage.py run -h 0.0.0.0
