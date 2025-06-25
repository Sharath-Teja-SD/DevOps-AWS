# A simple jenkins pipeline to verify if the docker slave configuration is working as expected.


# 📦 Project: My First Jenkins Pipeline

## 📌 Objective

This project demonstrates how to run a basic Jenkins pipeline using a Docker-based Node.js environment as the Jenkins agent.

---

## 🧠 Pipeline Summary

- The entire pipeline runs in a lightweight `node:16-alpine` Docker container.
- It contains a single stage: **Test**
- Inside the stage, we simply print the Node.js version using `node --version`.

---

## 🧾 Jenkinsfile Explained

```groovy
pipeline {
  agent {
    docker { image 'node:16-alpine' }
  }
  stages {
    stage('Test') {
      steps {
        sh 'node --version'
      }
    }
  }
}
```
---
## 🔹 Key Concepts

| **Keyword** | **Meaning** |
|-------------|-------------|
| `agent`     | Defines the environment (Docker in this case) to run the pipeline |
| `docker`    | Pulls a Docker image and runs the job inside it |
| `stage`     | A logical step in the pipeline process |
| `sh`        | Runs shell command inside the Docker container |

---

## 🛠️ How to Run the Pipeline

Follow these steps to run the pipeline in Jenkins:

1. Go to Jenkins Dashboard → click **New Item**
2. Enter name: `my-first-pipeline`
3. Select **Pipeline** → click **OK**
4. Under **Pipeline** configuration section:
   - Choose **Definition**: `Pipeline script`
   - Paste your `Jenkinsfile` script directly in the editor
5. Click **Save**
6. Click **Build Now**

---

## ✅ Expected Output

- Navigate to **Build → Console Output**
- You should see the pipeline execute and print the **Node.js version** successfully.

---

## 📌 Notes

- Make sure your Jenkins server has Docker installed and the Jenkins user has permission to run Docker.
- This example assumes a basic working Jenkins setup with required plugins.

---

Happy CI/CD-ing 🚀!
