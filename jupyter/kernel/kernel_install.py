import os
import json
import argparse
import shutil

parser = argparse.ArgumentParser()
parser.add_argument('--py',   type=str, required=True)
parser.add_argument('--name', type=str, required=True)
parser.add_argument('--dir',  type=str, required=True)
args = parser.parse_args()

kernel = json.dumps({
    "argv"        : [args.py, "-m", "ipykernel_launcher", "-f", "{connection_file}"],
    "display_name": args.name,
    "language"    : "python"
})

root_dir = f'{os.environ["HOME"]}/anaconda3/share/jupyter/kernels/{args.dir}'
os.makedirs(root_dir, exist_ok=False)

with open(f'{root_dir}/kernel.json', 'wt') as f:
    f.write(kernel)

for f in ['logo-32x32.png', 'logo-64x64.png']:
    shutil.copyfile(f, f'{root_dir}/{f}')

print('Kernel installed.')
print('Do not forget to run `pip install --upgrade ipykernel` in the new environment.')
