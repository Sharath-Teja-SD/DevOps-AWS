# 1. Update the system
sudo apt update -y

# 2. Install required dependencies
sudo apt install unzip curl -y

# 3. Download AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# 4. Unzip the downloaded package
unzip awscliv2.zip

# 5. Run the install script
sudo ./aws/install

# 6. Verify installation
aws --version
