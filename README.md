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

##### additional steps:
* on Jetson TX2:
  * to add needed repos, run:
```
cat <<EOT >> /etc/apt/sources.list.d/nvidia-l4t-apt-source.list
deb https://repo.download.nvidia.com/jetson/common r32.7 main
deb https://repo.download.nvidia.com/jetson/t186 r32.7 main
EOT
```
  * it install jetpack, run `sudo apt update && sudo apt install nvidia-jetpack`
  * to fix issue [ERR_NVGPUCTRPERM](https://developer.nvidia.com/nvidia-development-tools-solutions-err_nvgpuctrperm-permission-issue-performance-counters), run:
```
cat <<EOT >> /usr/bin/nvprof
#!/bin/bash
sudo `whereis nvprof | awk '{print $3}'` $@
EOT
```
  then run `sudo chmod +x /usr/bin/nvprof`
* to fix issue with [cuda-gdb initialization](https://forums.developer.nvidia.com/t/unable-to-debug-simple-cuda-program-cudbg-error-initialization-failure/222599/4?u=kr.eugene12), run `sudo chmod a+rw /dev/nvhost-dbg-gpu`
