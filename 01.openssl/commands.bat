echo DES
openssl enc -e -des -in plaintext.txt -out ciphertext.txt -k si

echo AES (key size 128 bits)
openssl enc -e -aes128 -in plaintext.txt -out ciphertext-aes.txt -k si

echo MAC (H-MAC)
openssl dgst -sha1 -hmac mykey plaintext.txt

echo RSA (key pair - chave privada em claro)
openssl genrsa -out private.pem 2048

echo RSA (extract public key)
openssl rsa -in private.pem -outform PEM -pubout -out public.pem

echo message in a bottle > mock.txt
echo encrypt with rsa
openssl rsautl -in message.txt -out mock.enc -pubin -inkey public.pem -encrypt

echo decrypt with rsa
openssl rsautl -in message.enc -out mock.dec -inkey private.pem -decrypt


echo * hash criptografico
echo message 1 > file1.txt

openssl dgst -sha256 file1.txt