# Terraform + Ansible SSH Automation Project

This project automates the provisioning of an **Ansible Control Node** and multiple **Worker Nodes** on AWS EC2 using Terraform. It also automates SSH key generation and configuration so the control node can connect to the worker nodes using passwordless SSH.

---

## 🚀 Features

- ✅ Automatic provisioning of EC2 instances (Control + Workers)
- ✅ RSA SSH key generation using Terraform (`tls_private_key`)
- ✅ User data scripts to:
  - Install required packages (`python3`, `pip`, `awscli`, `ansible`)
  - Configure `ansible` user on all nodes
  - Set up SSH private/public key pair on the control node
  - Inject control node's public key into worker nodes
- ✅ Private key saved to `key-pair/ansible-key.pem`
- ✅ Fully automated — no manual key copying or SSH needed

---

## 📁 Project Structure

```
terraform-ansible-ssh-automation/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── providers.tf
├── versions.tf
├── key-pair/
│   └── ansible-key.pem         # Auto-generated SSH private key
└── scripts/
    ├── control_node.sh.tftpl   # Control node setup script (templated)
    └── worker_node.sh.tftpl    # Worker node setup script (templated)
```

---

## 📦 Requirements

- Terraform >= 1.3.0
- AWS CLI configured (`aws configure`)
- Valid AWS account with permissions to create EC2 instances and key pairs

---

## ⚙️ Usage

1. **Initialize Terraform**

```bash
terraform init
```

2. **Review the Plan**

```bash
terraform plan
```

3. **Apply the Infrastructure**

```bash
terraform apply -auto-approve
```

4. **SSH into the Control Node**

```bash
ssh -i key-pair/ansible-key.pem ansible@<CONTROL_NODE_PUBLIC_IP>
```

5. **From Control Node → SSH to Worker Node**

```bash
ssh ansible@<WORKER_NODE_PUBLIC_IP>
```

---

## 📤 Outputs

After successful apply, Terraform shows:

- `control_node_public_ip`
- `worker_ips`

Use these to connect via SSH.

---

## 🔐 Notes

- The private key is stored at `key-pair/ansible-key.pem`
- Never share this PEM file publicly
- This is safe for local development and learning. For production use:
  - Use parameterized secrets or AWS Systems Manager Parameter Store
  - Consider Vault for SSH key lifecycle management

---

## 📚 Learnings

Skills demonstrated by this project:

- Terraform basics and modules
- Dynamic templating with `templatefile()`
- TLS key pair generation via Terraform
- EC2 provisioning and metadata scripts
- Linux `user_data` automation
- Ansible control node bootstrapping
- Secure SSH automation

---

## 💥 Cleanup

To destroy all resources:

```bash
terraform destroy -auto-approve
```

---


##  Author

- **Ajinkya-A3**
- GitHub: [@Ajinkya-A3](https://github.com/Ajinkya-A3)

---