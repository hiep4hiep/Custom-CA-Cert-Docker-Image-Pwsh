echo "This script will add your custom CA cert to a docker image tag pwsh-exchange-customca"

cat <<EOF > custom-ca.crt
-----BEGIN CERTIFICATE-----
<your certificate here>
-----END CERTIFICATE-----
EOF

docker pull demisto/pwsh-exchangev3:1.0.0.40040

cat <<EOF > Dockerfile
FROM demisto/pwsh-exchangev3:1.0.0.40040
ADD custom-ca.crt /usr/local/share/ca-certificates/custom-ca.crt
RUN chmod 644 /usr/local/share/ca-certificates/custom-ca.crt && update-ca-certificates
EOF

docker image build -t pwsh-exchange-customca .

docker image ls | grep pwsh-exchange-customca