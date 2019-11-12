import cv2
import os
import json
import argparse
import requests
import shutil

parser = argparse.ArgumentParser()
parser.add_argument('-gpu', action='store_true')
parser.add_argument('-py', type=str, required=True)
parser.add_argument('-name', type=str, required=True)
parser.add_argument('-logo', type=str, required=True)
parser.add_argument('-dir', type=str, required=True)
A = parser.parse_args()

argv = (["optirun"] if A.gpu else []) + [A.py] + ["-m", "ipykernel_launcher", "-f", "{connection_file}"]

kernel = json.dumps({
 "argv": argv,
 "display_name": A.name,
 "language": "python"
})

root_dir = f'{os.environ["HOME"]}/anaconda3/share/jupyter/kernels/{A.dir}'
os.makedirs(root_dir, exist_ok=False)

with open(f'{root_dir}/kernel.json', 'wt') as f:
    f.write(kernel)

r = requests.get(A.logo, stream=True, headers={'User-agent': 'Mozilla/5.0'})
if r.status_code == 200:
    with open("./logo.png", 'wb') as f:
        r.raw.decode_content = True
        shutil.copyfileobj(r.raw, f)

im = cv2.imread('./logo.png')

cv2.imwrite(f'{root_dir}/logo-32x32.png', cv2.resize(im, (32,32)))
cv2.imwrite(f'{root_dir}/logo-64x64.png', cv2.resize(im, (64,64)))

os.remove('./logo.png')
