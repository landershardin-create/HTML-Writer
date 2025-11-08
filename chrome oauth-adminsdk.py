# Python 3 example: authenticate as admin and call a Google API
# Requires: pip install google-auth google-auth-httplib2 google-auth-oauthlib requests

from google.oauth2 import service_account
import google.auth.transport.requests
import requests
import json

# Path to service account key JSON (must have domain-wide delegation enabled
# and appropriate Admin API scopes granted by a super admin).
SERVICE_ACCOUNT_FILE = 'service-account.json'
DELEGATED_ADMIN = 'admin@example.com'

SCOPES = [
    'https://www.googleapis.com/auth/admin.directory.device.chromeos',  # example
    'https://www.googleapis.com/auth/chrome.management.policy'         # example
]

credentials = service_account.Credentials.from_service_account_file(
    SERVICE_ACCOUNT_FILE, scopes=SCOPES
)
delegated = credentials.with_subject(DELEGATED_ADMIN)

authed_session = google.auth.transport.requests.AuthorizedSession(delegated)

# Example: GET a Chrome devices list (Admin SDK Directory API)
url = 'https://admin.googleapis.com/admin/directory/v1/customer/my_customer/devices/chromeos'
params = {'maxResults': 10}
resp = authed_session.get(url, params=params)
print(resp.status_code)
print(resp.text)