: '
Restore all revisions of a Helm release
Input:      Name of a version to backup
'
#!/bin/sh

# Restore all revisions
pushd backup
do kubectl apply -f $1.yaml -n kube-system
popd