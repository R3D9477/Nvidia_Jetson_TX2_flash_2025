### Flash Nvidia Jetson TX2 + Orbitty Carrier '25

1. on host download Nvidia SDK manager (.deb) and save to this folder with name `sdkmanager.deb`
2. on host run `./1_build.sh`
3. on host run `./2_run_sdkmanager-gui.sh`
  * 3.1. in SDK Manager authorize via QR-code
  * 3.2. on Step 1 in SDK Manager select target `Jetson TX2`
  * 3.3. on Step 2 in SDK Manager select Jetson OS Install & Flash (may uncheck `Jetson SDK Components`, will be installed manually later)
  * 3.4. wait until everything will be installed, **flashing process should fail**
  * 3.5. **do not click on 'Finish' button (do not close sdkmanager-ui)** and in second terminal run:
```
  docker commit `docker container ls | grep jetpack-sdk | awk '{print $1}'` jetpack-sdk
```
  * 3.6. in SDK Manager click **Finish** and close it
4. run Jetson TX2 in Recovery Mode
  * 4.1. on host run `./3_run_flash_tx2_oc.sh`
  * 4.2. in dialog choose `3. Orbitty`
  * 4.3. in next dialog choose `1. TX2`
  * 4.4. wait until process will be done.
5. run GUI Profiler on host side `./run_nsys-ui.sh`

### install Jetson SDK Components:
* to add needed repos, run on Jetson TX2:
```
cat <<EOT >> /etc/apt/sources.list.d/nvidia-l4t-apt-source.list
deb https://repo.download.nvidia.com/jetson/common r32.7 main
deb https://repo.download.nvidia.com/jetson/t186 r32.7 main
EOT
```
* to install jetpack, run on Jetson TX2 `sudo apt update && sudo apt install nvidia-jetpack`
* to fix issue [ERR_NVGPUCTRPERM](https://developer.nvidia.com/nvidia-development-tools-solutions-err_nvgpuctrperm-permission-issue-performance-counters), run on Jetson TX2:
```
cat <<EOT >> /usr/bin/nvprof
#!/bin/bash
sudo `whereis nvprof | awk '{print $3}'` $@
EOT
```
  then run `sudo chmod +x /usr/bin/nvprof`
* to fix issue with [cuda-gdb initialization](https://forums.developer.nvidia.com/t/unable-to-debug-simple-cuda-program-cudbg-error-initialization-failure/222599/4?u=kr.eugene12), run on Jetson TX2 `sudo chmod a+rw /dev/nvhost-dbg-gpu`
