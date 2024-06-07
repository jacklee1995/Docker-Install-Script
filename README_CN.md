# Docker安装脚本

[English](./README.md)

这个Bash脚本可以帮助你在Linux系统上轻松安装Docker和Docker Compose。脚本提供了多个Docker版本供选择，并根据所选的Docker版本自动安装兼容的Docker Compose版本。

## 功能特点

提供多个Docker版本选项：18.09.9、19.03.13、20.10.7和latest

默认选择最新版本（latest），用户可以直接回车选择默认版本

自动根据所选的Docker版本安装兼容的Docker Compose版本

安装过程中显示进度动画

支持用户中断安装，并进行清理操作

安装完成后启动Docker服务，并将当前用户添加到docker组

验证安装结果，显示已安装的Docker和Docker Compose版本

## 使用方法

1. 下载脚本文件到你的Linux系统中。
2. 为脚本文件添加可执行权限：

```sh
chmod +x install_docker.sh
```



3. 运行脚本：

```bash
./install_docker.sh
```



4. 按照提示选择要安装的Docker版本，或直接回车选择默认版本（latest）。
5. 等待安装完成。安装过程中会显示进度动画。
6. 安装完成后，脚本会显示已安装的Docker和Docker Compose版本。

## 注意事项

此脚本需要以root权限运行或使用sudo。

安装过程中需要访问互联网下载相关文件。

如果在安装过程中中断脚本（如按下Ctrl+C），脚本会执行清理操作，取消安装。

安装完成后，可能需要注销并重新登录，以使docker组的更改生效。

## 支持与反馈

由于Docker和Docker Compose在持续更新，此项目未必及时了解最新版本，如果发生大版本变动，可以提交issue提示作者将新的版本添加进来。如果你在使用此脚本时遇到任何问题，或有任何建议和反馈，请随时联系我们。我们将非常感谢你的宝贵意见。

希望这个脚本能够对你有所帮助！
