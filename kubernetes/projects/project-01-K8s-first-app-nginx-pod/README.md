# 🚀 Kubernetes Project 01 – Deploy NGINX using Pod YAML

This project demonstrates how to deploy your **first Kubernetes application** using a simple Pod YAML file. We manually created an NGINX pod using `kubectl` and verified its status using commands and `minikube ssh`.

---

## 💡 Purpose of This Project

- Understand the basics of Kubernetes Pods
- Learn how to write minimal YAML for creating a Pod
- Practice interacting with the pod using `kubectl`
- Verify network connectivity using `minikube ssh`
- Cleanly delete and manage pod lifecycle

---

## 📂 Project Structure
```
project-01-k8s-nginx-pod/
├── pod.yml # 🧱 NGINX Pod definition
└── README.md # 📘 Project explanation & deployment guide
```
---

## 🧰 Prerequisites

- Ubuntu VirtualBox with Docker
- Installed `kubectl` and `minikube`
- Kubernetes cluster running via Minikube

---

## 🛠️ Steps to Run

### 1. Start Minikube
```bash
minikube start
```
---
### 2. Apply Pod Definition
```bash
kubectl apply -f pod.yml
```
---
## 3. Verify Pod
```bash
kubectl get pods
kubectl describe pod nginx
kubectl logs nginx
```
- ✔️ < kubectl get pods > – shows pod name, status, restarts, and age
- ✔️ < kubectl describe pod > nginx – detailed info about the pod (IP, events, status, etc.)
- ✔️ < kubectl logs nginx > – shows the container logs

----

### 4. Access Pod via Minikube SSH
```bash

minikube ssh
curl 10.244.x.x   # Pod IP
```
You’ll see the default NGINX welcome page HTML.

---
## 5. Delete Pod
```bash
kubectl delete pod nginx
```
---

🏁 Status
✅ Project Completed
📦 Pod deployed, verified, deleted successfully
