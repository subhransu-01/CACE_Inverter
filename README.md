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
    
- To quickly test your installation, simply run ```cace --help``` in the nix shell.
  
- To get out from CACE enviornment use `exit`.  
## Command Line Interface  
  
CACE can be run directly from your command line:  
  
```cace [<datasheet>] [<output>] [options]```  
  
Where ```<datasheet>``` is an input specification in YAML (```*.yaml```) and ```<output>``` is an optional file path under which the output datasheet is to be saved (useful for conversion into a newer format). If ```<datasheet>``` is not specified, CACE searches for a file with the same name as the current directory under ```cace/``` with the file extension ```.yaml```.  
  
When run from the top level, this program parses the CACE characterization file, runs simulations for the specified parameters or all if none are given, and (optionally) outputs a modified file annotated with characterization results.  
  
The option ```--source```, restricts characterization to the specific netlist source, which is either schematic capture, layout extracted, C parasitic extracted or full R-C parasitic extracted. If not specified, then characterization is run on the full R-C parasitic extracted layout netlist if available, and the schematic captured netlist if not (option “best”).  
  
```
positional arguments:
  datasheet             input specification datasheet (YAML)
  output                output specification datasheet (YAML), used to convert
                        a datasheet to a newer format

options:
  -h, --help            show this help message and exit
  --version             show program's version number and exit
  -j JOBS, --jobs JOBS  total number of jobs running in parallel
  -s {schematic,layout,pex,rcx,best}, --source {schematic,layout,pex,rcx,best}
                        choose the netlist source for characterization. By
                        default, or when using 'best', characterization is run
                        on the full R-C parasitic extracted netlist if the
                        layout is available, else on the schematic captured
                        netlist.
  -p PARAMETER [PARAMETER ...], --parameter PARAMETER [PARAMETER ...]
                        run simulations on only the named parameters, by
                        default run all parameters
  --parallel-parameters PARALLEL_PARAMETERS
                        the maximum number of parameters running in parallel
  -f, --force           force new regeneration of all netlists
  --max-runs MAX_RUNS   the maximum number of runs to keep in the "runs/"
  --run-path RUN_PATH   override the default "runs/" directory
                        folder, the oldest runs will be deleted
  --no-plot             do not generate any graphs
  -l {ALL,DEBUG,INFO,WARNING,ERROR}, --log-level {ALL,DEBUG,INFO,WARNING,ERROR}
                        set the log level for a more fine-grained output
  --sequential          runs simulations sequentially
  --no-progress-bar     do not display the progress bar
  --nofail              do not fail on any errors or failing parameters
```  
  
This is an example output of CACE running the characterization for a simple OTA:  

<img width="1543" height="952" alt="image" src="https://github.com/user-attachments/assets/546bd45d-d3aa-4688-b60a-b02ad9329e32" />  
  
[Example of OTA](https://github.com/mole99/sky130_leo_ip__ota5t.git)  
  
## Datasheet Format  
The CACE datasheet contains the specification of your design and other important information. It acts as both documentation for the specifiaction but also as input for CACE.  
  
The following sections describe the structure of the datasheet.  
### Metadata  
Example entry:  
```bash
name:           inverter
description:    A simple inverter
PDK:            gf180mcuD
cace_format:    5.2
```
- ```name: <string>```
  
    ```Name of the design (cell name)```

- ```description: <string>```

    ```Description of the design```  

- ```PDK: <string>```

    ```Name of the PDK (no spaces)```  

- ```cace_format: <string>```

    ```Format version of the datasheet. Current version: 5.2.```
  
### Authorship  
Example entry:  
```bash
authorship:
  designer:         Subhransu Das
  creation_date:    Dec 17, 2025
  license:          MIT license
```  
- ```designer: <string>```

  ```The person to whom the design is attributed.```

- ```company: <string>``` (optional)
 
  ```The name of a company, if applicable.```

- ```institution: <string>``` (optional)

  ```The name of an institution, if applicable.```

- ```email: <string>``` (optional)

  ```E-mail for contact information.```

- ```creation_date: <datestamp>```

  ```Date that the CACE setup was made, or any meaningful date for the creation of the design.```

- ```modification_date: <datestamp>```

  ```Generally handled by the tools to specify when the characterization file was last updated.```

- ```license: <string>```

  ```A known license type, such as “Apache 2.0”.```
### Paths
The paths section is used to tell CACE where to find certain files of your design or where to generate files for simulation.  

Example entry:  

