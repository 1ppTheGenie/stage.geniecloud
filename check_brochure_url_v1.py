"""Check Dainelle's page for brochure URL"""
import requests
import re

url = "https://cloud.thegenie.ai/genie-pages/15a521b8-3fbf-4042-bce3-58e378cd9a52/lc-hollywood/index.html"
response = requests.get(url)

# Find downloadUrl
match = re.search(r"downloadUrl:`([^`]*)`", response.text)
if match:
    print(f"downloadUrl: '{match.group(1)}'")
else:
    print("downloadUrl not found")

# Find the brochure link
match2 = re.search(r'<a class="pdf-btn"[^>]*href="([^"]*)"', response.text)
if match2:
    print(f"Brochure href: '{match2.group(1)}'")
else:
    print("Brochure href not found")

