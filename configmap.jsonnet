function(name, namespace, edition, port) {
    apiVersion: 'v1',
    kind: 'ConfigMap',
    metadata: {
        name: name,
        namespace: namespace
    },
    data: {
        accept_eula: 'Y',
        mssql_pid: edition,
        mssql_tcp_port: '%s' % port
    }
}