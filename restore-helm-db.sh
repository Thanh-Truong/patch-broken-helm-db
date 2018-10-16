: '
Restore all revisions of a Helm release
Input:      Name of a release to backup
'
#!/bin/sh

# Restore all revisions
pushd backup
for filename in `ls * | awk '{print $1}'`; \
do kubectl apply -f $filename -n kube-system; \
done
popd