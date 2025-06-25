# Multi Stage Multi Agent

Set up a multi stage jenkins pipeline where each stage is run on a unique agent. This is a very useful approach when you have multi language application
or application that has conflicting dependencies.

# 🚀 Project: Multi-Stage Multi-Agent Pipeline

## 📌 Objective

This project shows how to use **different Docker containers as agents** for each stage in a Jenkins pipeline:
- Backend build: Maven agent
- Frontend build: Node.js agent

---

## 🧠 Pipeline Summary

| Stage       | Agent (Docker Image)                | Command              |
|-------------|-------------------------------------|----------------------|
| Back-end    | `maven:3.8.1-adoptopenjdk-11`       | `mvn --version`      |
| Front-end   | `node:16-alpine`                    | `node --version`     |

---

## 🧾 Jenkinsfile Explained

```groovy
pipeline {
  agent none
  stages {
    stage('Back-end') {
      agent {
        docker { image 'maven:3.8.1-adoptopenjdk-11' }
      }
      steps {
        sh 'mvn --version'
      }
    }
    stage('Front-end') {
      agent {
        docker { image 'node:16-alpine' }
      }
      steps {
        sh 'node --version'
      }
    }
  }
}
```
---
# 🔄 Multi-Stage, Multi-Agent Jenkins Pipeline

This project demonstrates a Jenkins pipeline setup where each stage uses its **own Docker agent**, providing better modularity and isolation between build steps (e.g., frontend vs backend).

---

## 🔹 Key Concepts

| **Keyword**        | **Meaning** |
|--------------------|-------------|
| `agent none`       | Disables the global agent so that each stage can define its own execution environment |
| `docker`           | Pulls a Docker image to run the respective stage inside a containerized environment |
| `stage`            | Represents a logical step in the pipeline |
| `sh`               | Executes shell commands inside the container defined for that stage |

Each stage defines its **own Docker container** and runs relevant commands for validation (e.g., checking tool versions).

---

## 🛠️ How to Run

1. Open Jenkins Dashboard → click **New Item**
2. Enter name: `multi-stage-multi-agent`
3. Select **Pipeline** → click **OK**
4. Scroll to the **Pipeline** section:
   - Choose **Definition**: `Pipeline script`
   - Paste your `Jenkinsfile` script in the textbox
5. Click **Save**
6. Click **Build Now**

---

## 🧪 Expected Output

- The console output will show:
  - Maven version output from a Maven container
  - Node.js version output from a Node container

Each stage runs independently inside its respective Docker container.

---

## ✅ Benefits of Multi-Agent Setup

- 🔄 **Separation of Concerns**  
  Frontend and backend tools run in different, purpose-specific containers.

- 🐳 **Docker-Powered Consistency**  
  Ensures reliable and reproducible build environments across teams and machines.

- ⚡ **Optimized Resource Usage**  
  Only required containers are spun up for each stage, keeping builds lean and modular.

---


---

## 📌 Notes

- Ensure Docker is installed and accessible by the Jenkins user.
- Suitable for CI pipelines involving multiple tech stacks (e.g., Java + Node.js).

---

Build smart, build clean 🚀

