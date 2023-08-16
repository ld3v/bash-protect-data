# Protect your data on internet
Just a solution, which allow me make sure that my data is safe on the internet.

## Generate an encrypted file
First, you need to create a new file to store all of privacy data like this
```conf
# .env
JUST_A_LONG_KEY="ANSDWAJDNAWJDNAJDNAWJD-DWANDAWJDNAFJEAF-FEFAMEVKVNVJSENBJRBR-VAEAEVE=VEV=VE=FAEFDD-AEF-AWC=A=WAV-AE"
```

Run the command `./run.sh generate ./.env` to create an encrypted file from `.env` file.

After created, you can remove your `.env` file, and now, all actions (read, add new values) can handle on the new file `.env.encrypted`.

## Read an encrypted file
To read the decrypted value, just run `./run.sh read ./.env.encrypted`, it'll show its content (if password is correct).

## Add new value to the encrypted file
To add new value to the encrypted file, just run `./run.sh add ./.env.encrypted "NEW_KEY=NEW_VALUE"`. It'll show you the data before encrypted (include before & new values).
