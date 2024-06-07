#!/bin/bash

# 定义清理函数
cleanup() {
    echo -e "\nUser interrupted the installation, cleaning up..."
    kill $installation_pid 2>/dev/null
    wait $installation_pid 2>/dev/null
    echo "Cleanup completed, installation canceled"
    exit 1
}

# 注册中断信号处理函数
trap cleanup SIGINT

# 定义可用的Docker版本
docker_versions=("18.09.9" "19.03.13" "20.10.7" "latest")

# 询问用户要安装的Docker版本
echo "Please select the Docker version to install (default is latest, press Enter directly):"
select version in "${docker_versions[@]}"
do
    case $version in
        "18.09.9"|"19.03.13"|"20.10.7"|"latest")
            docker_version=$version
            break
            ;;
        "")
            docker_version="latest"
            break
            ;;
        *)
            echo "Invalid selection, please select again"
            ;;
    esac
done

# 安装Docker
echo -n "Installing Docker $docker_version, please wait"
while true; do
    for i in {1..3}; do
        echo -n "."
        sleep 0.5
    done
    echo -n $'\b\b\b   \b\b\b'
done &
installation_pid=$!

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh --version $docker_version

kill $installation_pid
wait $installation_pid 2>/dev/null
echo "Docker installation completed"

# 启动Docker服务
sudo systemctl start docker
sudo systemctl enable docker

# 将当前用户添加到docker组，避免使用sudo
sudo usermod -aG docker $USER

# 获取已安装的Docker版本
installed_version=$(docker version --format '{{.Server.Version}}')

# 提取Docker主要版本号
docker_major_version=$(echo "$installed_version" | cut -d '.' -f 1)

# 根据Docker主要版本号确定兼容的Docker Compose版本号
if [ "$docker_major_version" -eq 18 ]; then
    compose_version="1.23.2"
elif [ "$docker_major_version" -eq 19 ]; then
    compose_version="1.24.1"
elif [ "$docker_major_version" -eq 20 ]; then
    compose_version="1.25.5"
else
    compose_version="1.29.2"
fi

# 安装Docker Compose
echo -n "Installing Docker Compose $compose_version, please wait"
while true; do
    for i in {1..3}; do
        echo -n "."
        sleep 0.5
    done
    echo -n $'\b\b\b   \b\b\b'
done &
installation_pid=$!

sudo curl -L "https://github.com/docker/compose/releases/download/${compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

kill $installation_pid
wait $installation_pid 2>/dev/null
echo "Docker Compose installation completed"

# 验证安装
echo "Docker version:"
docker --version
echo "Docker Compose version:"
docker-compose --version
