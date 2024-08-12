# HTTP/2 Testing Environment

Minimal DO build for testing HTTP/2

## Prerequisites

- Ansible installed on your local machine
- DigitalOcean account
- `doctl` CLI tool installed and configured
- Hostname 

## Project Structure

- `ansible/playbook.yml`: Ansible playbook for configuring the server
- `ansible/templates/vhost.conf.j2`: Apache virtual host configuration template
- `scripts/create_droplet.sh`: Script to create a DigitalOcean droplet
- `ansible/inventory.ini`: Ansible inventory file (uses the No-IP hostname)

## Setup Instructions

1. Create a DO droplet:
   ```
   ./scripts/create_droplet.sh
   ```

2. Update DNS record to point to the new droplet's IP address:
   - Go to e.g https://my.noip.com/dynamic-dns and update.

3. Run the Ansible playbook:
   ```
   ansible-playbook -i ansible/inventory.ini ansible/playbook.yml
   ```

## Notes

- The server is set up with both HTTP and HTTPS enabled, without forced redirection.
- Dynamic DNS allows you to always use the same hostname, regardless of IP changes.

## Author

Tim Collins

## Last Updated

08/12/2024
