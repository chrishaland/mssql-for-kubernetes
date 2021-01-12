function(name, namespace, sa_password) {
    apiVersion: 'v1',
    kind: 'Secret',
    metadata: {
        name: name,
        namespace: namespace
    },
    data: {
        mssql_sa_password: std.base64(sa_password)
    }
}