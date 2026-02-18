#!/bin/bash

sudo dnf install nginx cronie git -y

sudo systemctl enable --now nginx
sudo systemctl enable --now crond

sudo cp web/index.html /usr/share/nginx/html/index.html

sudo bash -c 'cat > /usr/local/bin/status.sh << "EOF"
#!/bin/bash
echo "Last Updated: $(date)"
echo "Server Health Report"
echo "--------------------"
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo ""
echo "Disk Usage:"
df -h /
echo ""
echo "Memory Usage:"
free -h
echo ""
echo "NGINX status:"
systemctl is-active nginx
EOF'

sudo chmod +x /usr/local/bin/status.sh

sudo bash -c 'echo "* * * * * /usr/local/bin/status.sh > /usr/share/nginx/html/status.txt" | crontab -'

echo "Setup complete. Open your server IP in browser."
