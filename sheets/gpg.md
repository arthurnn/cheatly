# GPG

## Encrypt/Decrypt data
### To encrypt data:
  gpg -e -u "Sender User Name" -r "Receiver User Name" somefile

### To decrypt data:
  gpg -d mydata.tar.gpg

## Keys manipulation
### Create a key:
  gpg --gen-key

### Export a key:
  gpg --export -a "User Name" > public.key

### Export a private key:
  gpg --export-secret-key -a "User Name" > private.key

### Import a friend's public key:
  gpg --import public.key

### Import a private key:
  gpg --allow-secret-key-import --import private.key

### Delete a public key:
  gpg --delete-key "User Name"

### Delete a private key:
  gpg --delete-secret-key "User Name"

### To list the keys in your public key ring:
  gpg --list-keys

### To list the keys in your secret key ring:
  gpg --list-secret-keys
