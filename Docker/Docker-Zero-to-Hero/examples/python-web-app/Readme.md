# 🐍 Django Web App – Docker Containerization

This project demonstrates how to containerize a Django application using Docker and run it seamlessly inside an isolated container environment.

> ✅ Based on the open-source learning repo: [Docker-Zero-to-Hero by Veeramalla](https://github.com/iam-veeramalla/Docker-Zero-to-Hero)  
> 🚀 Customized, built, and deployed by [Sharath Teja](https://github.com/Sharath-Teja-SD) on a live AWS EC2 instance

---

## 📂 Folder Structure
```
python-web-app/
├── Dockerfile
├── requirements.txt
└── devops/
    ├── db.sqlite3
    ├── manage.py
    ├── demo/
    │   ├── views.py
    │   ├── urls.py
    │   ├── templates/
    │   │   └── demo_site.html
    │   └── ...
    └── devops/
        ├── settings.py
        └── ...
```
---

## 🔍 Project Brief

This project demonstrates how to **containerize a Django web application using Docker**. The Django project, sourced from the [Docker-Zero-to-Hero](https://github.com/iam-veeramalla/Docker-Zero-to-Hero) repository, is built and executed inside a Docker container running on an **AWS EC2 Ubuntu instance**.

Key steps include:

- Writing a `Dockerfile` for the Django app
- Installing dependencies via `requirements.txt`
- Creating a virtual environment (`venv`)
- Running the Django development server on port `8000`
- Accessing the application via `http://<EC2-IP>:8000/demo/`

This project is ideal for beginners to understand how to dockerize Python/Django applications and deploy them in a real cloud environment.


---

## 🚀 How to Build & Run

### 🧱 Step 1: Build the Docker Image

```bash
docker build -t django-web-app:latest .
```
---

## 🐳 Step 2: Run the Docker Container

```bash
docker run -d -p 8000:8000 -it django-web-app:latest
```
---
App will be available at:  
🔗 [http://<YOUR_EC2_PUBLIC_IP>:8000/demo/](http://<YOUR_EC2_PUBLIC_IP>:8000/demo/)

---

## 🌟 What I Did

✅ Installed Docker on Ubuntu EC2  
✅ Cloned open-source Django web app from Docker-Zero-to-Hero  
✅ Wrote `Dockerfile` to containerize Django project  
✅ Installed requirements inside container (Django, etc.)  
✅ Built image & ran it in container exposing port `8000`  
✅ Accessed Django app via browser  

---

## 📚 Key Learnings

📦 Containerizing Django apps  
🐍 Using `venv` & installing packages inside Docker  
🔁 Building & running repeatable container environments  
🌐 Mapping host ↔ container ports using `-p` flag  

---

## 🧠 Credits

📚 **Original Source**: Veeramalla's *Docker-Zero-to-Hero*  
👨‍💻 **Customized, Built & Documented by**: Sharath Teja

---
