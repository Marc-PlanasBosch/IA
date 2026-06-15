import sys, re
import markdown
from xhtml2pdf import pisa

src, out = sys.argv[1], sys.argv[2]

with open(src, encoding="utf-8") as f:
    text = f.read()

# xhtml2pdf's built-in fonts lack emoji glyphs -> replace with text/ascii markers
emoji_map = {
    "🥇": "[1]", "🥈": "[2]", "🥉": "[3]",
    "⚠️": "[!]", "⚠": "[!]", "✅": "[OK]", "❌": "[X]",
    "❓": "[?]", "📌": "[*]", "🔑": "[clau]", "⭐": "[*]",
    "✓": "[v]", "🟢": "", "🟡": "", "📋": "", "✍️": "", "🎯": "", "💪": "", "📅": "",
}
for k, v in emoji_map.items():
    text = text.replace(k, v)

html_body = markdown.markdown(text, extensions=["tables", "fenced_code", "nl2br"])

css = """
@page { size: a4; margin: 1.8cm 1.6cm; }
body { font-family: Helvetica, Arial, sans-serif; font-size: 10.5pt; color: #1a1a1a; line-height: 1.4; }
h1 { font-size: 19pt; color: #1a3a6b; border-bottom: 2px solid #1a3a6b; padding-bottom: 4px; }
h2 { font-size: 14pt; color: #1a3a6b; margin-top: 16px; border-bottom: 1px solid #c8d4e6; padding-bottom: 2px; }
h3 { font-size: 12pt; color: #2c4a78; margin-top: 12px; }
code { font-family: Courier, monospace; font-size: 9pt; background-color: #f0f0f0; }
pre { font-family: Courier, monospace; font-size: 8.5pt; background-color: #f5f5f5;
      border: 1px solid #ddd; padding: 6px; }
pre code { background-color: transparent; }
table { border-collapse: collapse; width: 100%; margin: 8px 0; }
th { background-color: #1a3a6b; color: #ffffff; border: 1px solid #1a3a6b; padding: 5px; font-size: 9.5pt; }
td { border: 1px solid #b9c4d6; padding: 5px; font-size: 9.5pt; }
blockquote { border-left: 3px solid #1a3a6b; background-color: #eef2f8; padding: 4px 10px; color: #333; }
li { margin-bottom: 2px; }
"""

html = f"<html><head><meta charset='utf-8'><style>{css}</style></head><body>{html_body}</body></html>"

with open(out, "wb") as f:
    pisa.CreatePDF(html, dest=f, encoding="utf-8")

print("OK ->", out)
