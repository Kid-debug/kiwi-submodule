<!--- app-name: Kiwi TCMS -->

# Kiwi TCMS

Kiwi TCMS - open source test management

## Step before helm chart can be deployed

```console
git submodule update --init --recursive

cd charts/vX.X/helm

helm dependency update # need to update the mariadb's dependency first
```

## Known bugs
* [Kiwi: v13.2] MariaDB does not ignite init DB scripts. If you see the kiwi-mariadb-0 pod not Running (just 0/1), execute the following command:
```
kubectl [--namespace kiwi] exec -it kiwi-mariadb-0 -- bash /docker-entrypoint-initdb.d/prepare.sh
```
