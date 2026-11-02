from PIL import Image, ImageDraw, ImageFont
from pathlib import Path
import sys

FONT_FILE = "JetBrainsMono-Bold.ttf"
SIZE = 50
CHARS = " .'`^\",:;Il!i><~+_-?][}{1)(|\\/tfjrxnuvczXYUJCLQ0OZmwqpdbkhao*#MW&8%B@$"

font = ImageFont.truetype(FONT_FILE, SIZE)

ascent, descent = font.getmetrics()
cell_w = round(font.getlength("M"))
cell_h = ascent + descent

img = Image.new("L", (len(CHARS) * cell_w, cell_h), 0)
d = ImageDraw.Draw(img)

for i, ch in enumerate(CHARS):
    d.text((i * cell_w, ascent), ch, font=font, fill=255, anchor="ls")

print(f"Saving atlas with {cell_w}x{cell_h} cells")

project_root = Path(__file__).resolve().parent.parent

img.save(project_root / f"project/ascii/atlas-{cell_h}.png")
img.save(project_root / f"demo/ascii/atlas-{cell_h}.png")
