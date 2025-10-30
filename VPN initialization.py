import subprocess

def start_vpn(config_path="/etc/openvpn/client.conf"):
    try:
        subprocess.run(["sudo", "openvpn", "--config", config_path], check=True)
        print("VPN started successfully.")
    except subprocess.CalledProcessError:
        print("Failed to start VPN.")
