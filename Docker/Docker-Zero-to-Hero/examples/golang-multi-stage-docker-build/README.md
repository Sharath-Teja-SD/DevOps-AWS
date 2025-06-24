# Multi Stage Docker Build

The main purpose of choosing a golang based applciation to demostrate this example is golang is a statically-typed programming language that does not require a runtime in the traditional sense. Unlike dynamically-typed languages like Python, Ruby, and JavaScript, which rely on a runtime environment to execute their code, Go compiles directly to machine code, which can then be executed directly by the operating system.

So the real advantage of multi stage docker build and distro less images can be understand with a drastic decrease in the Image size.

---
# 🚀 Golang Calculator App – Multi-Stage Docker Build

This project demonstrates how to build a Go-based command-line calculator using Docker’s **multi-stage build** feature for producing a **super lightweight container** (~1.96MB).

> 🛠️ Original Source: [Veeramalla's Docker-Zero-to-Hero](https://github.com/iam-veeramalla/Docker-Zero-to-Hero)  
> 🧠 Customized, Dockerized & Practiced by [Sharath Teja](https://github.com/Sharath-Teja-SD)

---

## 📁 Project Structure

```
golang-multi-stage-docker-build/
├── Dockerfile                    # Multi-stage build definition
├── README.md                     # Project summary
├── calculator.go                 # Go CLI calculator
└── dockerfile-without-multistage/  # (Optional) Basic Dockerfile for comparison
```
---
# 🧮 Golang Calculator App – Multi-Stage Docker Build

This project demonstrates how to build and containerize a lightweight CLI-based calculator app using **Go (Golang)** and **Docker multi-stage builds**.

---

## 🚀 Project Highlights

- ✅ **Written in Go** – simple terminal-based calculator app
- ✅ **Multi-stage Docker Build** to reduce image size
- ✅ Final image size: ⚡ ~2MB (using `scratch` as the base)
- ✅ Interactive prompt to perform basic arithmetic
- ✅ Clean, production-ready Docker packaging

---

## 🛠️ How It Works

1. **Build Stage**:
   - Uses `ubuntu` as the base image
   - Installs Golang
   - Compiles the Go code into a static binary

2. **Final Stage**:
   - Uses `scratch` (minimal base)
   - Copies the compiled binary only
   - Result: A secure and super lightweight Docker image

---

## 🧠 Calculator Features

- Supports basic arithmetic:
  - ➕ Addition
  - ➖ Subtraction
  - ✖️ Multiplication
  - ➗ Division
- Example input format: `5 + 2` or `10 * 3`
- Loops until user types `exit`
- Handles invalid inputs gracefully

---

## 📦 Files

```bash
.
├── calculator.go        # Go source code
├── Dockerfile           # Multi-stage build Dockerfile
├── README.md            # Project description
└── dockerfile-without-multistage/  # (optional comparison)
```
---
---

## 🐳 Dockerfile (Multi-stage)

```dockerfile
# Stage 1 - Build
FROM ubuntu AS build
RUN apt-get update && apt-get install -y golang-go
ENV GO111MODULE=off
COPY . .
RUN CGO_ENABLED=0 go build -o /app .

# Stage 2 - Final (Minimal Image)
FROM scratch
COPY --from=build /app /app
ENTRYPOINT ["/app"]

```
---
## 📦 Build and Run

```bash
# Navigate to the project directory
cd golang-multi-stage-docker-build

# Build Docker image
docker build -t simplecalculator-multistage .

# Run the container
docker run -it --rm simplecalculator-multistage
```
---
## 💡 Purpose of this Project

- Learn how to optimize Docker images using **multi-stage builds**  
- Practice **minimal and secure containerization**  
- Package **Go CLI tools efficiently** for production use  

---

## 🧠 Credits

👨‍🏫 **Original Concept**: Veeramalla's *Docker-Zero-to-Hero*  
🚀 **Practiced & Customized by**: Sharath Teja

---
