# Software Installation with Terraform
In this Demo, we will deploy an EC2 instance and install Nginx at runtime by using **Chef** which is integrated with Terraform. For that, we need to:
## SSH Connection
We have to make a connection between the remote instance and the local machine. . First of all, we need to generate private and public SSH keys and provision only the public key to AWS:
```
resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}
```

After that we use SSH connection on Host:
```
connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
```
## Upload File 
we upload the shell file **installNginx.sh** required for the nginx installation:
```
provisioner "file" {
      source = "installNginx.sh"
      destination = "/tmp/installNginx.sh"
  }
```
## Remote Execution 
Remote-execution block is needed to execute the script in the uplaoded file:
```
provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installNginx.sh",
      "sudo sed -i -e 's/\r$//' /tmp/installNginx.sh",  # Remove the spurious CR characters.
      "sudo /tmp/installNginx.sh",
    ]
  }
```

Once the deployment is completed, nginx is installed and we can see its html page:
![](../nginx.png)

