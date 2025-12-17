<div align="center">

  # Ampere AI Agents

  **Build Agentic AI workflows using n8n, Ollama, and SearXNG on Ampere CPU**

  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  [![Platform](https://img.shields.io/badge/Platform-Ampere%20Altra%20%2F%20AmpereOne-blue)](https://amperecomputing.com)
  [![Docker](https://img.shields.io/badge/Docker-Enabled-2496ED?logo=docker)](https://docs.docker.com/get-docker/)

</div>

---

## Overview
This repository provides a multi-container Docker setup for an Agentic AI demonstration. It integrates the n8n workflow automation tool, a self-hosted Ollama large language model, and the SearXNG private metasearch engine.

### Download the demo repository
```shell
git clone https://github.com/AmpereComputingAI/ampere-ai-agents.git
cd ampere-ai-agents
git checkout <latest-release>
```

## Prerequisites
### Install Docker and Compose
Ensure that Docker Engine and Docker Compose are installed on your system. Follow the official instructions from the links below:  
**Docker Engine:** https://docs.docker.com/engine/install/ubuntu/  
**Docker Compose:** https://docs.docker.com/compose/install/linux/  

### Open the Required Ports
The application requires several ports to be accessible. Use the following commands to open them on a firewall like firewalld:  
```shell
sudo firewall-cmd --zone public --permanent --add-port 5678/tcp
sudo firewall-cmd --zone public --permanent --add-port 8081/tcp
sudo firewall-cmd --zone public --permanent --add-port 11434/tcp
sudo firewall-cmd --reload
```

## Start the Demo
Run the following command from the root of the project directory to start all the services in the background.  
```shell
./start-app.sh
```
You can verify that all containers are running correctly:  
```shell
$ docker ps
CONTAINER ID   IMAGE                                                 COMMAND                  CREATED          STATUS                    PORTS                                       NAMES
1a2b3c4d5e6f   ghcr.io/amperecomputingai/ampere-ai-agents:0.1.1      "docker-entrypoint.s…"   15 seconds ago   Up 14 seconds             0.0.0.0:5678->5678/tcp                      agentic_ai_demo_service
2b3c4d5e6f7g   docker.io/searxng/searxng:latest                      "/sbin/entrypoint.sh"    15 seconds ago   Up 14 seconds             0.0.0.0:8081->8080/tcp                      searxng
3c4d5e6f7g8h   ghcr.io/amperecomputingai/ollama-ampere:1.0.0-ol9     "bash -c 'ollama ser…"   15 seconds ago   Up 14 seconds (healthy)   0.0.0.0:11434->11434/tcp                    ollama_for_agent_service
```

## Accessing the Service
Once the containers are running, you can access the Agentic AI from your web browser.  
```
http://<server-IP>:5678
```
This is the main UI for building and managing your AI-powered workflows.  

## How to Use the Application
### Automated Model Download
Upon starting, the **Ollama** service will automatically download the llama3.2:1b model. This process may take a few minutes depending on your internet connection. Once downloaded, the model is immediately available to be used within your n8n workflows.

### Building Workflows
The core of this demo is the agentic_ai_demo_service, which runs n8n. You can build complex, agent-like workflows that can:

- Receive input via webhooks.
- Process logic and data.
- Query the Ollama language model for intelligent responses or analysis.
- Use the SearXNG service to perform web searches for real-time information.

For detailed instructions on how to create workflows, please refer to the official n8n documentation:
- https://docs.n8n.io/

## Stop the Demo
To stop and remove all the containers and associated networks, run the following script:
```shell
./stop-app.sh
```
## Services Overview
_agentic_ai_demo_service_: The core workflow automation platform powered by n8n.  
_ollama_for_agent_service_: Provides local LLM inference via the Ollama API.  
_searxng_: A private, hackable metasearch engine to provide workflows with web search capabilities. 

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## References
- https://n8n.io/
- https://github.com/ollama/ollama
- https://github.com/searxng/searxng
