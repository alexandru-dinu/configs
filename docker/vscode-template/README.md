Forked from [caesarnine/data-science-docker-vscode-template](https://github.com/caesarnine/data-science-docker-vscode-template) ([blog post](https://binal.pub/2019/04/running-vscode-in-docker) / [code-server repo](https://github.com/cdr/code-server)).

## Usage

- rename the folder to be your project name.
- modify the `environment.yml` file to include all the Python packages you need.
- run:

```bash
cd project
export PORT=8443
docker build -t project .
docker run -p $PORT:$PORT -v $(pwd)/data:/data -v $(pwd)/code:/code --rm -it project
```
This will start the container, with vscode running on http://localhost:$PORT.

### vscode Extensions and Configuration

- you can install any extension and modify configuration like you would locally
- any extensions you install and global configuration you update will persist in the `./data` folder so you don't have to redo it every time you restart the container
- by default, vscode will start up with the `./code` folder as the workspace, which you can change by modifying the `docker_entrypoint.sh` file
- you can pretty much use vscode as you would do locally, doing things like starting up terminals, setting Python formatters/linters, and so on
