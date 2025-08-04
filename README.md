#### Flash Nvidia Jetson TX2 + Orbitty Carrier '25

1. on host download Nvidia SDK manager (.deb) and save to this folder with name `sdkmanager.deb`
2. on host run `./1_build.sh`
3. turn Jetson TX2 into Recovery Mode
4. on host run `./2_run_sdkmanager-gui.sh`
  * 4.1. in SDK Manager authorize via QR-code
  * 4.2. on Step 1 in SDK Manager select target `Jetson TX2`
  * 4.3. on Step 2 in SDK Manager select Jetson OS Install & Flash
  * 4.4. wait until everything will be installed, flashing process should fail
5. after flashing failed, close SDK Manager and reset Jsetson TX2 and turn it to Recovery Mode again
  * 5.1. on host run `./3_run_flash_tx2_oc.sh`
  * 5.2. in dialog choose `3. Orbitty`
  * 5.3. in next dialog choose `1. TX2`
  * 5.4. wait until process will be done.
