# nvOC easy-to-use Linux Nvidia Mining OS
## Community Edition v2.1 (Beta Testing)
You can get nvOC running on your mining rig in two ways:
- Picking and burning a pre-built whole disk OS image (recommended)
- Cloning this repo on existing OS installations

### Pre-built images
Beta testing 19-2.1 image:

nvOC_V19-2.1beta_U16.04_N390_D180619

Download link: https://mega.nz/#!dNVTBIAC!7GGJpn9F-kehJOd1gW60CcR28BHTR3WMJxS7K-hd6Tg

nvOC_V19-2.1beta_U16.04_N390_D180619.img sha256:
cb607c8e028d3bc0a0e274c34b4e0def0c71330053f0c8328120a717e0029938

nvOC_V19-2.1beta_U16.04_N390_D180619.img.zip sha256:
7700dfdfc1cabab8a1dd9816a6322d6653c89943cb63afa59e79f88cfe14a6a9


You can also use old 2.0 images as base OS meanwhile and follow instructions in the section below to get nvOC 2.1+ installed. All needed instructions and links are on the old README for nvOC 2.0
1. Write the image with your favourite HDD image writer of choicce
2. Edit the nvOC configuration file named 1bash you can find in the small fat partition of rhe drive before booting for the first time. The same file contains settings descriptions that will help you completing the setup.

### Clone this repo
You can find all files needed to run nvOC in this repo but it's recommended you run nvOC from inside an old nvOC 2.0 pre-built image for optimal support. You may have issues trying to setup nvOC from repo on generic Ubuntu or other Linux distro installations.
1. Create a folder in a nice place on your drive and clone this repo into it

Starting from nvOC 2.1+ you can clone different versions of nvOC in different folder and keep all of them installed side-by-side for testing or evaluation purposes. However a single running nvOC instance is supported, you cannot run multiple ones at the same time. It's recommended you avoid cloning this repo directly into the user home directory

2. Setup your system to launch 2unix script from that folder on startup

Note that original nvOC startup method is based upon gnome-terminal profile. You can edit or disable this in termianl preferences.

3. Update the miners submodule

Just do 'git submodule update --init --remote miners', the correct git revision is automatically selected, which is the one linked to the nvOC tree you cloned.

4. Run the nvOC_miner_update.sh script to install the standard nvOC miner suite.

You can refer to https://github.com/papampi/nvOC_miners README for more help on how to update or enrich your miner collection in future

5. Edit nvOC configuration in 1bash file following contained instructions


Latest stable version : https://github.com/papampi/nvOC_by_fullzero_Community_Release/tree/19.2
