FROM python:3.10.13

RUN pip install  gunicorn

WORKDIR /code

COPY requirements.txt ./
RUN pip install -r requirements.txt --no-cache-dir

COPY email_relay.py ./
ENV PORT 8080

CMD ["gunicorn", "-b", "0.0.0.0:${PORT}", "--access-logfile=-", "--error-logfile=-", "email_relay:app"]
