def start_dnscrypt_proxy(config_path="/etc/dnscrypt-proxy/dnscrypt-proxy.toml"):
    try:
        subprocess.run(["dnscrypt-proxy", "-config", config_path], check=True)
        print("DNSCrypt Proxy started.")
    except subprocess.CalledProcessError:
        print("Failed to start DNSCrypt Proxy.")
