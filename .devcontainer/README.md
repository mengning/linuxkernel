# Ubuntu20.04 Linux C开发环境容器镜像制作指南

本教程用于制作符合 SuperIDE 使用标准的开发环境容器镜像ubuntu20.04-c。

* .devcontainer目录用于自定义和制作开发环境容器镜像
* 本仓库其他目录作为开发环境容器镜像中的exampleProject

## 环境准备

1.  安装Docker，https://www.docker.com/products/docker-desktop/
2.  安装Git， https://git-scm.com/download
3.  安装VS Code, https://code.visualstudio.com/

   * 3.1. 安装Dev Container插件

4. Clone本仓库

```shell
git clone https://gitee.com/SuperIDE/ubuntu20.04-c.git
```

5. 在VS Code中打开DevContainerExample项目，然后点击左下角远程开发，选择在容器中重新打开；或者选择在容器中打开文件夹。

这时即可使用环境容器中的开发工具, 在终端中执行：

```
make
./target
make clean
```

也可使用vscode定义的task执行既定任务（任务定义在`.vscode/tasks.json`中）:

- 快捷键`Ctrl + Shift + P`打开命令面板输入`task`
- 在列出的命令中选择想要执行的命令

## 自定义配置开发环境

开发环境的最终配置需要写在`.devcontainer/Dockerfile`中。

开发环境配置完成后，将最终需要保留的命令写在`.devcontainer/Dockerfile`中，例如需要设置环境变量并下载安装某个包：

```shell
export VARIABLE=new_value
sudo apt-get install packageName # superide用户的默认密码为123456
```

在`.devcontainer/Dockerfile`中为

```dockerfile
ENV VARIABLE=new_value
RUN apt-get install packageName
```

Tips：如果执行多条命令行语句使用&&将命令连接起来而不是使用多条`RUN`命令，因为每条 RUN 命令会在容器中多生成一层，具体参考[Dockerfile 指令](https://yeasy.gitbook.io/docker_practice/image/build)

## 测试示例项目

本仓库中除了.devcontainer目录，整个项目作为开发环境容器镜像中的exampleProject

最终的容器开发环境容器镜像需要一个示例项目，可以参考的示例项目构成是 Dev Container 打开的工作目录中除了`.devcontainer`文件夹的其余文件。可以在此基础上修改，也可以删除其余文件新建。

一个示例项目必须有的成员是`SuperIDE.ini`、`.vscode/tasks.json`和其他vscode配置文件。

其中`SuperIDE.ini`必须包含以下内容，分别是开发环境名称（可以自定义）和镜像名称（就是本镜像最终构建时的名称）

```ini
[env:ubuntu20.04-c]
env_image = superide/ubuntu20.04-c
```

`.vscode/tasks.json`文件是[vscode 的任务设置文件](https://code.visualstudio.com/Docs/editor/tasks)，SuperIDE 读取其完成构建，假如项目构建命令为`make`，命令行参数为`-j$(nproc)`则为一下形式，开发者可根据需要修改此文档。

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Build", //任务名称
      "type": "shell",
      "command": "make", //命令行命令
      "args": [
        // "-j$(nproc)" //命令行命令参数
      ],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}
```

示例项目完成后可以使用 vscode 提供的`Task`功能测试：使用`Ctrl`+`Shift`+`P`打开命令行执行`Tasks: Run Build Task`命令，验证执行结果是否符合预期。

## 制作容器镜像

以上工作完成后，可以将本项目下的 README.md 修改为镜像的说明文档，用来指导使用这个容器镜像的开发者。

此时，可以根据`.devcontainer/Dockerfile`中含有自定义开发环境制作容器镜像：

```shell
# 根据需要安装配置Docker，也可以在本地重新打开项目，然后使用Docker命令
docker build -f .devcontainer/Dockerfile -t ubuntu20.04-c . # 注意：如果在Windows下路径是.\.devcontainer\Dockerfile
```

## 上传开发环境

将构建好的容器镜像上传到仓库中，供开发者使用。这里的例子仓库是开发者自己的 DokcerHub，`superide`是 DokcerHub 账号名称

```shell
docker login # SuperIDE官方账号superide，密码需私下授权使用
docker tag ubuntu20.04-c superide/ubuntu20.04-c:v1.0 # 注意升级tag版本
docker push superide/ubuntu20.04-c:v1.0
docker tag ubuntu20.04-c superide/ubuntu20.04-c
docker push superide/ubuntu20.04-c # 更新latest
```
