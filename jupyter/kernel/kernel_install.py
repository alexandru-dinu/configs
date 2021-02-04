import argparse
import json
import shutil
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument("--python_path", type=str, required=True)
parser.add_argument("--display_name", type=str, required=True)
parser.add_argument("--kernel_dir", type=str, required=True)
args = parser.parse_args()

kernel_dir = Path.home() / "anaconda3/share/jupyter/kernels" / args.kernel_dir
kernel_dir.mkdir(exist_ok=False)

kernel = json.dumps(
    {
        "argv": [
            args.python_path,
            "-m",
            "ipykernel_launcher",
            "-f",
            "{connection_file}",
        ],
        "display_name": args.display_name,
        "language": "python",
    }
)

with open(kernel_dir / "kernel.json", "wt") as fp:
    fp.write(kernel)

for logo in ["logo-32x32.png", "logo-64x64.png"]:
    shutil.copyfile(logo, kernel_dir / logo)

print("Kernel installed.")
print("Do not forget to run `pip install --upgrade ipykernel` in the new environment.")
