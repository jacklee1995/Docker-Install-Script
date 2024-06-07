# Docker Installation Script

[中文](./README_CN.md)

This Bash script assists you in easily installing Docker and Docker Compose on a Linux system. It offers multiple Docker versions to choose from and automatically installs a compatible version of Docker Compose based on the selected Docker version.

## Features

- Provides multiple Docker version options: 18.09.9, 19.03.13, 20.10.7, and latest
- Default selection is the latest version (latest); users can press Enter to choose the default version
- Automatically installs a compatible version of Docker Compose based on the selected Docker version
- Displays a progress animation during the installation process
- Supports user interruption during installation and performs cleanup operations
- Starts the Docker service after installation and adds the current user to the docker group
- Verifies the installation result and displays the installed Docker and Docker Compose versions

## Usage

1. Download the script file to your Linux system.
2. Add executable permissions to the script file:

```sh
chmod +x install_docker.sh
```

3. Run the script:

```bash
./install_docker.sh
```

4. Follow the prompts to select the Docker version to install, or press Enter to choose the default version (latest).
5. Wait for the installation to complete. A progress animation will be displayed during the installation.
6. After installation, the script will display the installed Docker and Docker Compose versions.

## Notes

- This script needs to be run with root privileges or using sudo.
- Internet access is required to download the necessary files during installation.
- If the script is interrupted during the installation (e.g., by pressing Ctrl+C), it will perform cleanup operations and cancel the installation.
- After installation, you may need to log out and log back in to apply changes to the docker group.

## Support and Feedback

Due to the continuous updates of Docker and Docker Compose, this project may not promptly include the latest versions. If there are major version changes, you can submit an issue to notify the author to add the new versions. If you encounter any problems while using this script or have any suggestions and feedback, please feel free to contact us. We highly appreciate your valuable input.

We hope this script will be helpful to you!
