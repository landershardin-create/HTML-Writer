def secure_connection():
    start_vpn()
    start_dnscrypt_proxy()
    apply_firewall_rules()

secure_connection()
