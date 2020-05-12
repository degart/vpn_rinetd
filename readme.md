#### setup
```shell
docker build --network host -t degart/vpn_rinetd:v.0.0.1 .
```

###### If VPN server used two-factor authentication method, you need to run connect script manually and enter verification CODE
```shell
docker exec -it <container_name> sh
/connectvpn.sh
```
