def apply_firewall_rules():
    rules = [
        ["iptables", "-F"],  # Flush existing rules
        ["iptables", "-P", "INPUT", "DROP"],
        ["iptables", "-P", "FORWARD", "DROP"],
        ["iptables", "-P", "OUTPUT", "ACCEPT"],
        ["iptables", "-A", "INPUT", "-m", "conntrack", "--ctstate", "ESTABLISHED,RELATED", "-j", "ACCEPT"],
        ["iptables", "-A", "INPUT", "-i", "lo", "-j", "ACCEPT"],
        ["iptables", "-A", "INPUT", "-p", "tcp", "--dport", "22", "-j", "ACCEPT"],  # SSH
        ["iptables", "-A", "INPUT", "-p", "udp", "--dport", "1194", "-j", "ACCEPT"],  # OpenVPN
    ]
    for rule in rules:
        subprocess.run(["sudo"] + rule)

    print("Firewall rules applied.")
