# Cloud Support Dashboard

🚀 **Live Demo:** http://3.149.5.217

## Architecture

Internet → AWS Security Group (HTTP/SSH) → EC2 Instance (Amazon Linux) → NGINX → Static Dashboard  
A Bash script generates server health data (uptime, disk, memory, nginx status).  
Cron runs the script every minute and publishes the output to `/status.txt`.
