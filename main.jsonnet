local namespace = import 'namespace.jsonnet';
local configmap = import 'configmap.jsonnet';
local secret = import 'secret.jsonnet';
local service = import 'service.jsonnet';
local deployment = import 'deployment.jsonnet';
local storageclass = import 'storage-class.jsonnet';
local persistentvolume = import 'persistent-volume.jsonnet';
local persistentvolumeclaim = import 'persistent-volume-claim.jsonnet';

local MSSQL_PORT = 1433;

function(
    NAME='mssql',
    NAMESPACE='default',
    NODE='docker-desktop',
    STORAGE='5Gi',
    ISTIO_ENABLED=false,
    MSSQL_TAG='2019-latest',
    MSSQL_VERSION='Developer',
    MSSQL_SA_PASSWORD
) [
    namespace(NAMESPACE, ISTIO_ENABLED),
    configmap(NAME, NAMESPACE, MSSQL_VERSION, MSSQL_PORT),
    secret(NAME, NAMESPACE, MSSQL_SA_PASSWORD),
    service(NAME, NAMESPACE, MSSQL_PORT),
    storageclass(NAME, NAMESPACE),
    persistentvolume(NAME, NAMESPACE, STORAGE, NODE),
    persistentvolumeclaim(NAME, NAMESPACE, STORAGE),
    deployment(NAME, NAMESPACE, MSSQL_TAG, MSSQL_PORT)
]
