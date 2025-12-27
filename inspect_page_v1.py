"""Inspect current page for issues"""
import requests
import re

url = 'https://cloud.thegenie.ai/genie-pages/pls-10037-rebecca-place/pls-hollywood/index.html'
response = requests.get(url)
html = response.text

print("=== CHECKING PRICE PER SQ FT ===")
if 'Price Per' in html or 'price per' in html.lower():
    matches = re.findall(r'.{50}[Pp]rice [Pp]er.{50}', html)
    for m in matches[:3]:
        print(f"Found: ...{m}...")
else:
    print("NOT FOUND - Price Per Sq Ft has been removed")

print("\n=== CHECKING THEME SETTINGS ===")
# Check HTML class
html_class = re.search(r'<html[^>]*class="([^"]*)"', html)
if html_class:
    print(f"HTML class: {html_class.group(1)}")

# Check body class
body_class = re.search(r'<body[^>]*class="([^"]*)"', html)
if body_class:
    print(f"Body class: {body_class.group(1)}")

# Check theme CSS
theme_css = re.findall(r'themes/[^"\']+\.css', html)
print(f"Theme CSS files: {theme_css}")

# Check gHub settings
ghub_match = re.search(r'window\.gHub = \{([^}]+)\}', html)
if ghub_match:
    print(f"\nwindow.gHub settings (partial):")
    settings = ghub_match.group(1)[:500]
    print(settings)

print("\n=== CHECKING FOR HARDCODED COLORS ===")
# Look for inline styles with color
blue_styles = re.findall(r'style="[^"]*(?:blue|#[0-9a-f]{3,6}|rgb\([^)]*\))[^"]*"', html, re.IGNORECASE)[:5]
if blue_styles:
    print("Found inline color styles:")
    for s in blue_styles:
        print(f"  {s[:100]}...")

