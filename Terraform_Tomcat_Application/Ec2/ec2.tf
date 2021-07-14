variable "subnet-id" {}
variable "sg-groups" {}

resource "aws_instance" "terraform_wapp" {
    ami = "ami-0ed05376b59b90e46"
    instance_type = "t2.micro"
    security_groups = ["${var.sg-groups}"]
    subnet_id = "${var.subnet-id}"
    key_name               = "california"
    count         = 1
    associate_public_ip_address = true
    
    provisioner "remote-exec" {
      inline = [
        #### Install Jenkins on Ubuntu #####
        #"wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -",
        #"sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
        #"sudo apt update -qq",
        #"sudo apt install -y default-jre",
        #"sudo apt install -y jenkins",
        #"sudo systemctl start jenkins",
        #"sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080",
        #"sudo sh -c \"iptables-save > /etc/iptables.rules\"",
        #"echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections",
        #"echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections",
        #"sudo apt-get -y install iptables-persistent",
        #"sudo ufw allow 8080",
        #### Install Httpd on Ubuntu #####
        "sudo apt-get update",
        "sudo apt install -y apache2",
        "sudo systemctl start apache2",
        ####Install Tomcat on Ubuntu#####
        "sudo apt update",
        "sudo apt-cache search tomcat",
        "sudo apt install tomcat9 tomcat9-admin -y",
        "ss -ltn",
        "sudo systemctl enable tomcat9",
        "sudo ufw allow from any to any port 8080 proto tcp",
        "cd /var/lib/tomcat9/webapps/ROOT"
      ] 
   }

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = "${file("~/california.pem")}"
  }

    tags = {
      "Name"      = "Jenkins_Server"
      "Terraform" = "true"
    }
}
    
   ##PATH FOR TOMCAT   /var/lib/tomcat9/webapps/ROOT
   ###  https://youtu.be/TX9cjaIW3gE