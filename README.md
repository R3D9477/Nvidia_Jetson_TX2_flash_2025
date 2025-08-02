#### Flash Nvidia Jetson TX2 + Orbitty Carrier '25

1. on host download Nvidia SDK manager (.deb) and save to this folder with name `sdkmanager.deb`
2. on host run `./build.sh`
3. on host run `./run-bash.sh`
4. in container run `sdkmanager-gui`
5. turn Jetson TX2 into Recovery Mode
6. on Step 1 in SDK Manager select target `Jetson TX2`
7. on Step 2 in SDK Manager select Jetson OS Install & Flash
8. wait until everything will be installed, flashing process should fail
9. after flashing failed, close SDK Manager and switch to container's shell
10. reset Jsetson TX2 and turn it to Recovery Mode again
11. in container run command `/flash_tx2_oc.sh`
12. in dialog choose `3. Orbitty`, in next dialog choose `1. TX2`

wait until process will be done.
