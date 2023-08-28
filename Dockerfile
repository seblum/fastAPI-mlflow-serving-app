FROM python:3.10.11-slim-buster


ENV MLFLOW_TRACKING_URI=host.docker.internal:5008
ENV MLFLOW_MODEL_NAME=basic-keras-cnn
ENV MLFLOW_MODEL_VERSION=5

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade -r requirements.txt
COPY ./app /app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
