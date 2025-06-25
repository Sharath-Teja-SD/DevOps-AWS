# 🐳 Docker-Zero-to-Hero – Hands-on Docker Learning

This project is a collection of Docker fundamentals and hands-on examples cloned from the open-source [Docker-Zero-to-Hero](https://github.com/iam-veeramalla/Docker-Zero-to-Hero) repository.  
Sharath Teja has containerized, customized, and practiced these examples on a live AWS EC2 environment.

---

## 📂 Project Structure

```
Docker/
└── Docker-Zero-to-Hero/
    ├── README.md
    ├── commands.md
    ├── volumes.md
    ├── networking.md
    └── examples/
        ├── first-docker-file/
        ├── golang-multi-stage-docker-build/
        └── python-web-app/
```


---

## ✅ What I Did

- ✅ Installed Docker on Ubuntu EC2
- ✅ Verified Docker installation using `hello-world`
- ✅ Cloned `Docker-Zero-to-Hero` GitHub repo
- ✅ Built Docker image from Python `app.py`
- ✅ Tagged & pushed image to [Docker Hub](https://hub.docker.com/repository/docker/sharathtejas21/my-first-docker-image)
- ✅ Pulled & ran the same image on EC2
- ✅ Converted embedded repo to clean folder & pushed to GitHub

---

## 🐳 My First Docker Image

- 📦 Docker Image: `sharathtejas21/my-first-docker-image:latest`
- 🔗 Docker Hub: [View Image on DockerHub](https://hub.docker.com/r/sharathtejas21/my-first-docker-image)

```bash
# Build the image
docker build -t sharathtejas21/my-first-docker-image .

# Push to Docker Hub
docker push sharathtejas21/my-first-docker-image

# Pull from Docker Hub
docker pull sharathtejas21/my-first-docker-image

# Run it
docker run sharathtejas21/my-first-docker-image
```
---

# 📦 Docker-Zero-to-Hero

## 📚 Key Learnings

- 🧱 **Dockerfile creation**
- ⚙️ **Container management**
- 🛠️ **Docker commands** (`build`, `tag`, `push`, `run`, `pull`)
- 📤 **DockerHub publishing**
- 🌐 **Networking & volumes concepts**

---

## 🧠 Credits

- 📚 Original Source: [Veeramalla's Docker-Zero-to-Hero](https://github.com/iam-veeramalla/Docker-Zero-to-Hero/tree/main)
- 👨‍💻 Customized, Practiced & Documented by: [Sharath Teja](https://github.com/Sharath-Teja-SD)


---
