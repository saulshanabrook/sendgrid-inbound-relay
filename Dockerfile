FROM python:3.10.13

RUN DEBIAN_FRONTEND=noninteractive apt update \
	&& DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends ruby \
	&& DEBIAN_FRONTEND=noninteractive apt -y --purge autoremove \
	&& DEBIAN_FRONTEND=noninteractive apt clean
RUN gem install pups

RUN pip install  gunicorn

WORKDIR /code

COPY requirements.txt ./
RUN pip install -r requirements.txt --no-cache-dir

COPY email_relay.py ./
ENV PORT 8080
COPY boot /sbin/boot
RUN chmod +x /sbin/boot

CMD ["/sbin/boot"]
