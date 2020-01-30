case "$OSTYPE" in
  darwin*)
    # Make sure aws-vault uses the default login keychain by default
    export AWS_VAULT_KEYCHAIN_NAME="login"
esac
