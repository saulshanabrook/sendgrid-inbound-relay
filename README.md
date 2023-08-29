# Sendgrid Inbound Email Webhook to SMTP Relay

This repository contains a simple Python script that can be used to receive emails from Sendgrid's Inbound Parse Webhook and relay them to an SMTP server.


## Usage
You can use this with Docker:

```bash
docker run -e PORT 8080 -p 8080:8080 -e SMTP_HOST my-smtp.server ghcr.io/saulshanabrook/sendgrid-inbound-relay:main
```


## Usage with discourse

Make a container for this with `nano containers/inbound-relay.yml`:

```yml
base_image:  ghcr.io/saulshanabrook/sendgrid-inbound-relay:main
update_pups: false

expose:
  - "8080:8080"

env:
  PORT: "8080"
  SMTP_HOST: forum.valleyhousing.coop
```

