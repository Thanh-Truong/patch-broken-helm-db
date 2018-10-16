: '
Backup all revisions of a Helm release
Input:      Name of a release to backup
Output:     List of YAML files corresponding to revisions of the (Helm) release
'
#!/bin/sh

# Backup
for configmap in `kubectl get configmaps -l OWNER=TILLER,NAME=$1 -n kube-system \
    | awk 'NR > 1 { print $1 }'`; \
do kubectl get cm $configmap -n kube-system --export -o yaml > ./backup/$configmap.yaml ; \
done

# Delete all revisions
for configmap in `kubectl get configmaps -l OWNER=TILLER,NAME=$1 -n kube-system \
     | awk 'NR > 1 { print $1 }'`; \
 do kubectl delete cm $configmap -n kube-system; \
done
