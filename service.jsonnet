function(name, namespace, port) {
    apiVersion: 'v1',
    kind: 'Service',
    metadata: {
        name: name,
        namespace: namespace,
        labels: {
            app: name
        },
    },
    spec: {
        type: 'LoadBalancer',
        selector: {
            app: name
        },
        ports: [
            { protocol: 'TCP', port: port }
        ],
    },
}
