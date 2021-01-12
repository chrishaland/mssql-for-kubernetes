# mssql-for-kubernetes
Microsoft SQL Server deployment for Kubernetes, written in jsonnet.

```
jsonnet \
  --tla-str NAME='mssql' \
  --tla-str NAMESPACE='default' \
  --tla-str NODE='docker-desktop' \
  --tla-str STORAGE='5Gi' \
  --tla-code ISTIO_ENABLED=false \
  --tla-str MSSQL_TAG='2019-latest' \
  --tla-str MSSQL_VERSION='Developer' \
  --tla-str MSSQL_SA_PASSWORD='yourStrong(!)Password' \
  --tla-str MSSQL_DATA_PATH='/run/desktop/mnt/host/d/wsl/volumes/mssql' \
  --yaml-stream \
  main.jsonnet | kubectl apply --filename -
```