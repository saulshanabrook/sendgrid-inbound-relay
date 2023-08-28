"""
Relay emails POSTed by sengrid to the local SMTP server at `mail-reciever`.
"""

import json
import os
import smtplib

from flask import Flask, request

app = Flask(__name__)


@app.route("/", methods=["GET", "POST"])
def hello_world():
    payload = request.form
    # Use envelope to get the sender and recipient, instead of to/from from email
    # so that to matches our address, not who was in the "to" field...
    envelope = json.loads(payload["envelope"])
    # https://docs.sendgrid.com/for-developers/parsing-email/setting-up-the-inbound-parse-webhook#raw-parameters
    with smtplib.SMTP(
        os.environ["SMTP_HOST"], port=int(os.environ.get("SMTP_PORT", 80))
    ) as smtp:
        smtp.sendmail(envelope["from"], envelope["to"], payload["email"])
    return "OK"


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=os.environ["PORT"])
