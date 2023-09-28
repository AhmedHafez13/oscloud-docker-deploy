FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libmemcached-dev \
    zlib1g-dev

# Copy only the Pipfile and Pipfile.lock to the container
COPY Pipfile Pipfile.lock ./

# Install dependencies using Pipenv
RUN pip install --no-cache-dir pipenv && \
    pipenv install --system --deploy --ignore-pipfile

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
