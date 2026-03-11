# --- SSH Agent Management using Keychain ---

# The 'keychain' utility is used here to manage a single, persistent ssh-agent
# across multiple terminal sessions (Zsh tabs/windows). This prevents the creation
# of multiple ssh-agent processes and requires the user to enter their SSH key
# passphrase only once per system startup.

# 1. keychain: Executes the keychain utility.
# 2. --quiet: Suppresses verbose output (warnings, startup messages).
# 3. --eval: Instructs keychain to output the 'export' commands needed to set
#    environment variables (like SSH_AGENT_PID and SSH_AUTH_SOCK).
# 4. id_ed25519: Specifies the SSH key file to be managed and automatically loaded
#    into the agent.
# 5. $(): Captures the output (the 'export' commands) of the keychain command.
# 6. eval: Executes the captured 'export' commands within the current Zsh shell.
# RESULT: All new terminal shells connect to the same existing ssh-agent.
if [[ -o interactive ]]; then
    if command -v keychain &> /dev/null; then
        # Thêm khóa của bạn vào đây, nếu cần. Keychain sẽ kiểm tra
        # xem khóa đã được thêm vào agent chưa.
        eval "$(keychain --quiet --eval id_ed25519)"
    fi
fi
