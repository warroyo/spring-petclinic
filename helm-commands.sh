
#initial steady

helm upgrade  --install --namespace default --values ./chart/petclinic/values.yaml --set productionDeployment.image.repository=harbor.lab.home/library/petclinic,productionDeployment.image.buildversion=1.0.0,productionDeployment.weight=100,productionDeployment.replicaCount=2,canaryDeployment.image.repository=harbor.lab.home/library/petclinic,canaryDeployment.image.buildversion=1.0.0,canaryDeployment.replicaCount=0,canaryDeployment.weight=0,canaryDeployment.apiversion=v1,productionDeployment.apiversion=v1 --wait petclinic ./chart/petclinic



# CANARY 10 percent
helm upgrade  --install --namespace default --values ./chart/petclinic/values.yaml --set productionDeployment.image.repository=harbor.lab.home/library/petclinic,productionDeployment.image.buildversion=1.0.0,productionDeployment.weight=90,productionDeployment.replicaCount=2,canaryDeployment.image.repository=harbor.lab.home/library/petclinic,canaryDeployment.image.buildversion=2.0.0,canaryDeployment.replicaCount=2,canaryDeployment.weight=10,canaryDeployment.apiversion=v2,productionDeployment.apiversion=v1 --wait petclinic ./chart/petclinic

# CANARY 90 percent
helm upgrade  --install --namespace default --values ./chart/petclinic/values.yaml --set productionDeployment.image.repository=harbor.lab.home/library/petclinic,productionDeployment.image.buildversion=1.0.0,productionDeployment.weight=10,productionDeployment.replicaCount=2,canaryDeployment.image.repository=harbor.lab.home/library/petclinic,canaryDeployment.image.buildversion=2.0.0,canaryDeployment.replicaCount=2,canaryDeployment.weight=90,canaryDeployment.apiversion=v2,productionDeployment.apiversion=v1 --wait petclinic ./chart/petclinic

# CANARY 100 percent
helm upgrade  --install --namespace default --values ./chart/petclinic/values.yaml --set productionDeployment.image.repository=harbor.lab.home/library/petclinic,productionDeployment.image.buildversion=1.0.0,productionDeployment.weight=0,productionDeployment.replicaCount=2,canaryDeployment.image.repository=harbor.lab.home/library/petclinic,canaryDeployment.image.buildversion=2.0.0,canaryDeployment.replicaCount=2,canaryDeployment.weight=100,canaryDeployment.apiversion=v2,productionDeployment.apiversion=v1 --wait petclinic ./chart/petclinic

# CANARY 100 percent, rolling upgrade of prod deployment
helm upgrade  --install --namespace default --values ./chart/petclinic/values.yaml --set productionDeployment.image.repository=harbor.lab.home/library/petclinic,productionDeployment.image.buildversion=2.0.0,productionDeployment.weight=0,productionDeployment.replicaCount=2,canaryDeployment.image.repository=harbor.lab.home/library/petclinic,canaryDeployment.image.buildversion=2.0.0,canaryDeployment.replicaCount=2,canaryDeployment.weight=100,canaryDeployment.apiversion=v2,productionDeployment.apiversion=v2 --wait petclinic ./chart/petclinic

# PROD 100 percent
helm upgrade  --install --namespace default --values ./chart/petclinic/values.yaml --set productionDeployment.image.repository=harbor.lab.home/library/petclinic,productionDeployment.image.buildversion=2.0.0,productionDeployment.weight=100,productionDeployment.replicaCount=2,canaryDeployment.image.repository=harbor.lab.home/library/petclinic,canaryDeployment.image.buildversion=2.0.0,canaryDeployment.replicaCount=2,canaryDeployment.weight=0,canaryDeployment.apiversion=v2,productionDeployment.apiversion=v2 --wait petclinic ./chart/petclinic

# NEW STEADY STATE : PROD 100 percent , 0 replicas of CANARY
helm upgrade  --install --namespace default --values ./chart/petclinic/values.yaml --set productionDeployment.image.repository=harbor.lab.home/library/petclinic,productionDeployment.image.buildversion=2.0.0,productionDeployment.weight=100,productionDeployment.replicaCount=2,canaryDeployment.image.repository=harbor.lab.home/library/petclinic,canaryDeployment.image.buildversion=2.0.0,canaryDeployment.replicaCount=0,canaryDeployment.weight=0,canaryDeployment.apiversion=v2,productionDeployment.apiversion=v2 --wait petclinic ./chart/petclinic

# Rollback to previous version (CAN be executed at any state of pipeline)
helm upgrade  --install --namespace default --values ./chart/petclinic/values.yaml --set productionDeployment.image.repository=harbor.lab.home/library/petclinic,productionDeployment.image.buildversion=1.0.0,productionDeployment.weight=100,productionDeployment.replicaCount=2,canaryDeployment.image.repository=harbor.lab.home/library/petclinic,canaryDeployment.image.buildversion=1.0.0,canaryDeployment.replicaCount=0,canaryDeployment.weight=0canaryDeployment.apiversion=v1,productionDeployment.apiversion=v1 --wait petclinic ./chart/petclinic

