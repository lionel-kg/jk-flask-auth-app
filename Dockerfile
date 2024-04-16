FROM python:3.13.0a2-alpine

WORKDIR /app

COPY requirements.txt .

RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del .build-deps

COPY . .

EXPOSE 5000

ENV FLASK_ENV=production

CMD ["flask", "run", "--host=0.0.0.0"]
