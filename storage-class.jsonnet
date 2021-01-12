function(name, namespace) {
    apiVersion: 'storage.k8s.io/v1',
    kind: 'StorageClass',
    metadata: {
        name: name,
        namespace: namespace
    },
    provisioner: 'kubernetes.io/no-provisioner',
    volumeBindingMode: 'WaitForFirstConsumer'
}