: '
Patch a Helm release with change-status.yaml file
Input:      Name of a release to patch
'
#!/bin/sh

kubectl patch cm $1 --patch "$(cat change-status.yaml)"