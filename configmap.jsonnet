function(name, namespace, edition) {
    apiVersion: 'v1',
    kind: 'ConfigMap',
    metadata: {
        name: name,
        namespace: namespace
    },
    data: {
        accept_eula: 'Y',
        mssql_pid: edition
    }
}