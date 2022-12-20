# Custom-CA-Cert-Docker-Image-Pwsh
This bash script will create a custom Docker image based on a demisto Powershell Exchange Online v3 image and add custom trusted CA certificate. The custom Docker image now can be used by XSOAR Powershell EXO based integration to initiate session in a SSL decryption enabled network environment.

# How to

### Podman
If your XSOAR is built with Podman
1. Copy the podman-build-custom-image.sh to /home/demisto on XSOAR server.
2. Edit the script (vi podman-build-custom-image.sh) and replace the section `<your certificate here>` with your CA certificate (in PEM format)
![image](https://user-images.githubusercontent.com/41276379/208784440-5bf0746f-f0ba-4320-ad3a-af5c797c5edb.png)
3. Run the script as demisto. This is important to run under demisto user because Podman is running in rootless mode.
```
$ sudo su demisto
$ cd /home/demisto
$ chmod +x podman-build-custom-image.sh
$ ./podman-build-custom-image.sh
```
4. Verify by going to XSOAR GUI console and run command /docker_images
![image](https://user-images.githubusercontent.com/41276379/208785017-34859ebf-c419-4a61-92ba-37a0f74bd0c1.png)

### Docker
If you XSOAR is built with Docker:
1. Copy the docker-build-custom-image.sh to any directory on XSOAR server.
2. Edit the script (vi docker-build-custom-image.sh) and replace the section `<your certificate here>` with your CA certificate (in PEM format)
![image](https://user-images.githubusercontent.com/41276379/208784440-5bf0746f-f0ba-4320-ad3a-af5c797c5edb.png)
3. Run the script as root
```
$ chmod +x docker-build-custom-image.sh
$ ./docker-build-custom-image.sh
```
4. Verify by going to XSOAR GUI console and run command /docker_images

![image](https://user-images.githubusercontent.com/41276379/208785017-34859ebf-c419-4a61-92ba-37a0f74bd0c1.png)

