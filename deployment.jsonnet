function(name, namespace, version, port) {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: {
        name: name,
        namespace: namespace
    },
    spec: {
        replicas: 1,
        selector: {
            matchLabels: {
                app: name,
                version: version
            }
        },
        template: {
            metadata: {
                labels: {
                    app: name,
                    version: version
                }
            },
            spec: {
                containers: [
                    {
                        name: name,
                        image: 'mcr.microsoft.com/mssql/server:%s' % version,
                        resources: {
                            requests: { memory: '2Gi', cpu: '10m' },
                            limits: { memory: '2Gi', cpu: '10m' }
                        },
                        ports: [
                            { containerPort: port }
                        ],
                        env: [
                            {
                                name: 'ACCEPT_EULA',
                                valueFrom: {
                                    configMapKeyRef: {
                                        name: name,
                                        key: 'accept_eula'
                                    },
                                }
                            },
                            {
                                name: 'MSSQL_PID',
                                valueFrom: {
                                    configMapKeyRef: {
                                        name: name,
                                        key: 'mssql_pid'
                                    }
                                }
                            },
                            {
                                name: 'MSSQL_TCP_PORT',
                                valueFrom: {
                                    configMapKeyRef: {
                                        name: name,
                                        key: 'mssql_tcp_port'
                                    }
                                }
                            },
                            {
                                name: 'MSSQL_SA_PASSWORD',
                                valueFrom: {
                                    secretKeyRef: {
                                        name: name,
                                        key: 'mssql_sa_password'
                                    }
                                }
                            }
                            
                        ],
                        volumeMounts: [
                            {
                                name: 'data',
                                mountPath: '/var/opt/mssql/data'
                            }
                        ]
                    }
                ],
                volumes: [
                    {
                        name: 'data',
                        persistentVolumeClaim: {
                            claimName: name
                        }
                    }
                ]
            }
        }
    }
}
