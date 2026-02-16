# Cloud Support Runbook

## 1. Website not loading

Check service:
systemctl status nginx

Check local response:
curl localhost

If local works but browser fails:
Check AWS security group and public IP.

---

## 2. SSH connection fails

Check key exists:
ls -l *.pem

Fix permissions:
chmod 400 key.pem

Connect:
ssh -i key.pem ec2-user@IP

---

## 3. Disk full / no space left

Check disk:
df -h

Find large files:
sudo du -sh /* 2>/dev/null | sort -hr | head

---

## 4. Service failure

Check status:
systemctl status SERVICE

Check logs:
journalctl -u SERVICE --no-pager

Restart:
sudo systemctl restart SERVICE
