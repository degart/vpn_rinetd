#### setup
```shell
docker build --network host -t degart/vpn_rinetd:v.0.0.1 .
```

###### If for VPN using two-factor authentication you need to run connect script manually and enter verification CODE
```shell
docker exec -it <container_name> /connectvpn.sh
```
