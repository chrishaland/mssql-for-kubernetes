function(name, namespace, storage, node, path) {
    apiVersion: 'v1',
    kind: 'PersistentVolume',
    metadata: {
        name: name,
        namespace: namespace
    },
    spec: {
        accessModes: [
            'ReadWriteOnce'
        ],
        capacity: {
            storage: storage
        },
        "local": {
            path: path
        },
        nodeAffinity: {
            required: {
                nodeSelectorTerms: [
                    {
                        matchExpressions: [
                            {
                                key: 'kubernetes.io/hostname',
                                operator: 'In',
                                values: [
                                    node
                                ]
                            }
                        ]
                    }
                ]
            }
        },
        persistentVolumeReclaimPolicy: 'Retain',
        storageClassName: name
    }
}