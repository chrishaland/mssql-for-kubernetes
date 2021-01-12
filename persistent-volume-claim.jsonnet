function(name, namespace, storage) {
    apiVersion: 'v1',
    kind: 'PersistentVolumeClaim',
    metadata: {
        name: name,
        namespace: namespace
    },
    spec: {
        accessModes: [
            'ReadWriteOnce'
        ],
        resources: {
            requests: {
                storage: storage
            }
        },
        storageClassName: name
    }
}