<!--- app-name: one37id-ledgercache -->

# One37ID Helm Chart for Ledger Cache

The One37 Ledger Cache is an proprietary, Hyperledger Indy ledger indexer
that make it possible to query information about ledger artifacts using
standard SQL queries..

## TL;DR

### From The Chart Repo

``` bash
# One37 ID Helm Charts
helm repo add helm137 https://fedoraman137.github.io/helm-test
helm repo update
helm install one37-ledgercache helm137/one37id-mediator -f secrets.yaml
```

### From the project clone

```bash
git clone https://github.com/one37id/charts
cd charts
helm install one37-ledgercache one37id-mediator -f secrets.yaml
```
