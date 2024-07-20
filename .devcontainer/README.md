# 开发环境容器镜像制作指南

本教程用于制作开发环境容器镜像

* .devcontainer目录用于自定义和制作开发环境容器镜像，以及生成开发环境容器

## 环境准备

1.  安装Docker，https://www.docker.com/products/docker-desktop/
2.  安装Git， https://git-scm.com/download
3.  安装VS Code, https://code.visualstudio.com/

   * 3.1. 安装Dev Containers插件

4. 在VS Code中Clone一个项目的git仓库
5. 在VS Code中点击左下角远程开发，选择在容器中重新打开；或者选择在容器中打开文件夹。

这时使用开发环境容器即是通过.devcontainer/devcontainer.json中image指定的容器镜像或者通过Dockerfile生成的容器环境

```
{
	"name": "ubuntu20.04-linuxkernel",
	// Base Development Container Images https://mcr.microsoft.com/en-us/product/devcontainers/base/about
	// "image": "mcr.microsoft.com/devcontainers/base:dev-ubuntu-20.04",
	"build": {
		"dockerfile": "Dockerfile"
	}
}
```

如果项目配置了vscode tasks任务，也可使用vscode定义的task执行既定任务（任务定义在`.vscode/tasks.json`中）:

- 快捷键`Ctrl + Shift + P`打开命令面板输入`task`
- 在列出的命令中选择想要执行的命令

## 自定义配置开发环境

一般开发环境容器是通过`.devcontainer/Dockerfile`来配置生成的。

开发环境配置完成后，将最终需要保留的命令写在`.devcontainer/Dockerfile`中，例如需要设置环境变量并下载安装某个包：

```shell
export VARIABLE=new_value
sudo apt-get install packageName
```

在`.devcontainer/Dockerfile`中为

```dockerfile
ENV VARIABLE=new_value
RUN apt-get install packageName
```

Tips：如果执行多条命令行语句使用&&将命令连接起来而不是使用多条`RUN`命令，因为每条 RUN 命令会在容器中多生成一层，具体参考[Dockerfile 指令](https://yeasy.gitbook.io/docker_practice/image/build)

## 配置了vscode tasks任务

`.vscode/tasks.json`文件是[vscode 的任务设置文件](https://code.visualstudio.com/Docs/editor/tasks)，假如项目构建命令为`make`，命令行参数为`-j$(nproc)`则为以下形式，开发者可根据需要修改此文档。

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Build", //任务名称
      "type": "shell",
      "command": "make", //命令行命令
      "args": [
        "-j$(nproc)" //命令行命令参数
      ],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}
```

如果项目配置了vscode tasks任务，可以使用 vscode 提供的`Task`功能测试：使用`Ctrl`+`Shift`+`P`打开命令行执行`Tasks: Run Build Task`命令，验证执行结果是否符合预期。

## 制作容器镜像

可以使用`.devcontainer/Dockerfile`制作容器镜像，如下命令：

```shell
sudo apt install docker.io
# 根据需要安装配置Docker，也可以在本地重新打开项目，然后使用Docker命令
docker build -f .devcontainer/Dockerfile -t ubuntu20.04-linuxkernel . # 注意：如果在Windows下路径是.\.devcontainer\Dockerfile
```

也可以将当前正在运行的容器直接保存为容器镜像

```shell
# 确保当前容器正在运行。可以使用以下命令列出当前正在运行的容器：
docker ps

# 获取当前容器的容器 ID，可以通过上一步骤中的输出或者以下命令获取：
docker ps -aqf "name=your_container_name"

# 使用以下命令将当前容器保存为镜像：
docker commit container_id ubuntu20.04-linuxkernel

其中，container_id 为docker ps中获取的容器ID。
```

## 上传开发环境

将构建好的容器镜像上传到镜像仓库中，供其他开发者使用。镜像仓库默认是Docker官方的DockerHub，这里使用devstar.cn镜像仓库，`mengning`是镜像仓库的账号名称。

```shell
docker login devstar.cn # 这里镜像仓库的账号和密码
docker tag ubuntu20.04-linuxkernel mengning/ubuntu20.04-linuxkernel:v1.0 # 注意升级tag版本
docker push mengning/ubuntu20.04-linuxkernel:v1.0
docker tag ubuntu20.04-linuxkernel mengning/ubuntu20.04-linuxkernel
docker push mengning/ubuntu20.04-linuxkernel # 更新latest
```

这样我们就可以在.devcontainer/devcontainer.json或Dockerfile中使用镜像名称devstar.cn/mengning/ubuntu20.04-linuxkernel
