# patch-broken-helm-db
Helm is not always reliable:  after a failed Helm upgrade, other consecutive Helm upgrade failures could led to an inconsistent stae of Helm database. Consequently, one could never be able to upgrade successfully again !!

While waiting for a fix from Helm, which is under discussion as in [here](https://github.com/helm/helm/issues/1193), I made some small scripts to overcome the problem.

1. Run `helm history foo` to get overview of versions and their status of a Helm release `foo`. 
2. Run `./backup-helm-db foo` to back up all versions of `foo`. This will also clear all versions of `foo` and to Helm, there is no such `foo` release. 
3. `ls -l backup` to list all versions
4. Pick the lastest succesfully version and restore it.
```
./restore-a-version foo.v20
```
5. Try `helm upgrade` again.

(Optional) If it is still marked as `FAILED`, then you can patch it with
```
./patch -a-helm-release foo.v21
```

6. When things are good, you can restore all versions prior the lastest succesfully version in step `4`.