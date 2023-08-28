# Sendgrid Inbound Email Webhook to SMTP Relay

This repository contains a simple Python script that can be used to receive emails from Sendgrid's Inbound Parse Webhook and relay them to an SMTP server.


## Usage
You can use this with Docker:

```bash
docker run -e PORT 8080 -p 8080:8080 -e SMTP_HOST my-smtp.server  saulshanabrook/sengrid-inbound-relay
```
