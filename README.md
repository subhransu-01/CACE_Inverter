# Documentation
## Circuit Automatic Characterization Engine
CACE is a framework for analog and mixed-signal circuits that enables automatic characterization under various conditions and with Monte Carlo and mismatch analysis. After all parameters have been run under the given conditions, CACE produces a summary showing the circuit performance. CACE requires the designer to create a specification, called the datasheet in CACE jargon, which contains the parameters, their conditions and limits. In addition, the designer must set up the directory structure of the design in a regular way and create template testbenches for the parameters.
# Installation Overview
CACE currently supports two primary methods of installation: using Nix and the Python-only method.
## Nix (Recommended)
Nix is a build system for Linux and macOS allowing for cachable and reproducible builds, and is the primary build system for CACE.
## Nix-based Installation
Nix is a package manager for Linux and macOS allowing for cachable and reproducible builds, and is the primary build system for CACE.
## For Ubuntu/Other Linux
- ### Minimum Requirements
- Quad-core CPU running at 2.0 GHz+
- 8 GiB of RAM
- ### Recommended Requirements
- 6th Gen Intel® Core CPU or later OR AMD Ryzen™️ 1000-series or later
- 16 GiB of RAM  
#### It will primarily support Ubuntu 20.04+ for CACE.  
## Install and Setup EDA Tools  
[To install Ubuntu 24.04 on Windows Subsytem for Linux (WSL)](https://github.com/silicon-vlsi/SI-2025-AnalogIC/blob/main/content/cad-install-setup-wsl-ubuntu.md)   
[To install and setup the EDA tools](https://github.com/silicon-vlsi/SI-2025-AnalogIC/blob/main/content/cad-install-eda.md)  
## Installing Nix  
#### ⚠️ Warning  
Do **not** install Nix using apt. The version of Nix offered by apt is more often than not severely out-of-date and may cause issues.  
#### You will need `curl` to install Nix.  
To install curl on Ubuntu, simply type in the following in your terminal:  
```bash 
sudo apt-get install -y curl
```  
After that, simply run this command:  
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm --extra-conf "
    extra-substituters = https://nix-cache.fossi-foundation.org
    extra-trusted-public-keys = nix-cache.fossi-foundation.org:3+K59iFwXqKsL7BNu6Guy0v+uTlwsxYQxjspXzqLYQs=
"
```
Enter your password if prompted. This should take around 5 minutes.  
Make sure to close all terminals after you’re done with this step.  
## Cloning CACE  
```bash
git clone https://github.com/fossi-foundation/cace
```
- That’s it. Whenever you want to use CACE, run `nix-shell` in the repository root directory and you’ll have a full CACE environment. The first time might take around 10 minutes while binaries are pulled from the cache.  
- To quickly test your installation, simply run cace --help in the nix shell.  
- To get out from CACE enviornment use `exit`.
