#!/usr/bin/env python3
import getpass
import keyring
import os
from keyring.backends.chainer import ChainerBackend
from keyring.backends.fail import Keyring as FailKeyring

# List available backends
keyring_backends = keyring.backend.get_all_keyring()
print("Available keyring backends:")
for kb in keyring_backends:
    print(f" - {kb.__class__.__name__}")

# Use the default keyring (should fall back to a working one)
print(f"\nUsing keyring: {keyring.get_keyring().__class__.__name__}")

def main():
    # Get password securely (no echo)
    print("\nThis will store your restic password in your system keyring")
    password = getpass.getpass("Enter restic password: ")

    # Store the password
    keyring.set_password("restic", "restic-repo", password)

    # Verify
    stored = keyring.get_password("restic", "restic-repo")
    if stored == password:
        print("✓ Password stored successfully")
    else:
        print("✗ Failed to verify password storage")

if __name__ == "__main__":
    main()
