import os, struct, zlib

w = h = 180
pixels = [(0, 0, 0, 0)] * (w * h)

def set_px(x, y, color):
    if 0 <= x < w and 0 <= y < h:
        pixels[y * w + x] = color

def draw_circle(cx, cy, r, color):
    for y in range(max(0, cy - r), min(h, cy + r + 1)):
        for x in range(max(0, cx - r), min(w, cx + r + 1)):
            dx = x - cx
            dy = y - cy
            if dx * dx + dy * dy <= r * r:
                set_px(x, y, color)

def draw_round_square(x0, y0, x1, y1, radius, color):
    for y in range(y0, y1 + 1):
        for x in range(x0, x1 + 1):
            if x < x0 + radius and y < y0 + radius:
                if (x - (x0 + radius)) ** 2 + (y - (y0 + radius)) ** 2 > radius ** 2:
                    continue
            if x > x1 - radius and y < y0 + radius:
                if (x - (x1 - radius)) ** 2 + (y - (y0 + radius)) ** 2 > radius ** 2:
                    continue
            if x < x0 + radius and y > y1 - radius:
                if (x - (x0 + radius)) ** 2 + (y - (y1 - radius)) ** 2 > radius ** 2:
                    continue
            if x > x1 - radius and y > y1 - radius:
                if (x - (x1 - radius)) ** 2 + (y - (y1 - radius)) ** 2 > radius ** 2:
                    continue
            set_px(x, y, color)

# Colors tuned to match the provided reference
purple_bg = (44, 15, 71, 255)
petal = (193, 166, 222, 220)
yellow = (243, 217, 118, 255)
white = (255, 255, 255, 255)

# Background rounded square
x0, y0, x1, y1 = 10, 10, 170, 170
radius = 34
draw_round_square(x0, y0, x1, y1, radius, purple_bg)

# Four soft purple petals
for cx, cy in [(58, 58), (122, 58), (58, 122), (122, 122)]:
    draw_circle(cx, cy, 42, petal)

# Center yellow and white dots
for cx, cy, r, color in [(90, 90, 22, yellow), (90, 90, 8, white)]:
    draw_circle(cx, cy, r, color)

raw = bytearray()
for y in range(h):
    raw.append(0)
    for x in range(w):
        r, g, b, a = pixels[y * w + x]
        raw.extend((r, g, b, a))

def chunk(tag, data):
    return (
        struct.pack('>I', len(data)) +
        tag +
        data +
        struct.pack('>I', zlib.crc32(tag + data) & 0xFFFFFFFF)
    )

png = b'\x89PNG\r\n\x1a\n'
png += chunk(b'IHDR', struct.pack('>IIBBBBB', w, h, 8, 6, 0, 0, 0))
png += chunk(b'IDAT', zlib.compress(bytes(raw), 9))
png += chunk(b'IEND', b'')
out_path = r'D:\laragon\www\BENEVO\public\images\benevo-logo.png'
with open(out_path, 'wb') as f:
    f.write(png)

# Remove stale SVG duplicates to avoid the app using the wrong asset
for stale in [
    r'D:\laragon\www\BENEVO\public\images\benevo-logo.svg',
    r'D:\laragon\www\BENEVO\public\logo-benevo.svg',
]:
    if os.path.exists(stale):
        os.remove(stale)

print('written', out_path)
print('exists', os.path.exists(out_path), 'size', os.path.getsize(out_path))
