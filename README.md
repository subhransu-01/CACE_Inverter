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
  
  Name of the design (cell name)

- ```description: <string>```

    Description of the design

- ```PDK: <string>```

    Name of the PDK (no spaces)  

- ```cace_format: <string>```

    Format version of the datasheet. Current version: 5.2.
  
### Authorship  
Example entry:  
```bash
authorship:
  designer:         Subhransu Das
  creation_date:    Dec 17, 2025
  license:          MIT license
```  
- ```designer: <string>```

  The person to whom the design is attributed.

- ```company: <string>``` (optional)
 
  The name of a company, if applicable.

- ```institution: <string>``` (optional)

  The name of an institution, if applicable.

- ```email: <string>``` (optional)

  E-mail for contact information.

- ```creation_date: <datestamp>```

  Date that the CACE setup was made, or any meaningful date for the creation of the design.

- ```modification_date: <datestamp>```

  Generally handled by the tools to specify when the characterization file was last updated.

- ```license: <string>```

  A known license type, such as “Apache 2.0”.
  
### Paths
The paths section is used to tell CACE where to find certain files of your design or where to generate files for simulation.  

Example entry:  

```bash
paths:
  root:             ..
  schematic:        xschem
  netlist:          netlist
  documentation:    docs
```
- ```root: <path>```

  This is the location of the project and the root of all the other paths in this dictionary. Normally it is set to `..` to refer to the parent directory of `cace/`.
  
- ```schematic: <path>```

  Location of any schematics (xschem) and symbols for the design. The xschemrc should be located here.

- ```magic: <path>``` (optional)

  Location of any layout in magic (.mag) format.

- ```layout: <path>```

  Location of any layout in GDS (.gds or .gds.gz) format. Note that any magic layout (if given) will be converted to GDS and saved here.


- ```netlist: <path>```

  Location of all SPICE netlists. This netlist is usually automatically generated by cace, with subdirectories for each netlist type according to the netlist source (see --source option): “schematic”, “layout” (for LVS), “pex” (C-parasitic extracted layout), and “rcx” (R-C-parasitic extracted layout).

- ```documentation: <path>```

  Location for the auto-generated documentation of the design.

- ```runs: <path>``` (optional)

  Location for the run directory.  
### Pins  
The pins of the design, mainly used for documentation purposes. The names of the pins are checked against the schematic.  

Example entry:  

```bash
pins:
  VDD:
    description: Power supply
    direction: inout
    type: power
    Vmin: 1.7
    Vmax: 1.9
    Imin: 0
    Imax: 0.01
  ...
  ```

- ```name: <string>```

  The pin name. Must match the name on the schematic or netlist. Vectors should be indexed with “:” and will be expanded when needed. “b7:0” expands to “b7, b6, b5, …” while “b[7:0]” expands to “b[7], b[6], b[5], …” (Note that this is more flexible than the convention for condition names described below.)

- ```description: <string>```
 
  Text description of the pin. May contain spaces.

- ```type: <string>```

  The type may be one of “digital”, “signal”, “power”, or “ground”.

- ```direction: <string>```

  The direction may be one of “input”, “output”, or “inout”.

- ```Vmin: <number>|<expression>```

  The pin minimum voltage may be a value or may be referenced to another pin; and may be referenced to another pin with an offset (e.g., “vss - 0.3”).

- ```Vmax: <number>|<expression>```

  The pin maximum voltage may be a value or may be referenced to another pin; and may be referenced to another pin with an offset (e.g., “vdd + 0.3”).

- ```Imin: <number>|<expression>```

  The pin maximum sink current -a minimum value if specified as a negative current- may be a value or may be referenced to another pin; and may be referenced to another pin with an offset.

- ```Imax: <number>|<expression>```

  The pin maximum source current may be a value or may be referenced to another pin; and may be referenced to another pin with an offset.

### Default Conditions
The default conditions under which to evaluate the parameters.  

Example entry:  

```bash
default_conditions:
  corner:
    display: Corner
    description: The corner of the wafer
    typical: tt
    unit: V
  ...
```

- ```name: <string>```

  The name of the condition; this name is meaningful because it will match a variable name used in a schematic or netlist. The representation in the netlist is always ${} to prevent accidental substitutions of matching strings. Any set of signals can be bundled, but the delimiters for the bundle must be brackets; e.g., b[7:0], with single bits called out as, e.g., b[0].

- ```description: <string>```

  A description of the condition.

- ```display: <string>```

  A short, typically one-word value to display for the condition.

- ```unit: <string>```

  The unit of measure used to display the condition value.

- ```typical: <value>```

  If present, the default typical value of the condition.

- ```maximum: <value>```

  If present, the default maximum value of the condition.

- ```minimum: <value>```

  If present, the default minimum value of the condition.

- ```enumerate: <values>```

  If present, instead of min/typ/max values, the values are enumerated from a space-separated list supplied in (see above; long lists may be backslash-newline terminated).

- ```step: linear|logarithmic```

  If not present, then only values min/typ/max are evaluated. If present, then values are automatically enumerated from min to max inclusive either in linear (default) or logarithmic progression. If typ exists and is not in the enumeration, then it is evaluated in addition.

- ```stepsize: <value>```

  If not present, then a stepsize of 1 is assumed for linear enumeration or 2 for logarithmic enumeration. Otherwise, the enumeration steps by additive values for linear enumeration or multiplicative values for logarithmic enumeration.

### Parameters  
The parameters section is used to tell CACE about the simulations, graphs, equations, etc.  

Example entry:  

```bash
parameters:
  dc_response:
    description: DC response
    display: DC response
    status: skip
    unit: V
    tool:
       ngspice:
        template: dc.sch
        format: ascii
        suffix: .data
        variables: [null, Vin, Vout]
        jobs: 4
    plot:
      dc:
        suffix: .svg
        xaxis: Vin
        yaxis: Vout
    variables:
      Vin:
        display: Vin
        unit: V
      Vout:
        display: Vout
        unit: V
    conditions:
      temperature:
        minimum: -40
        typical: 27
        maximum: 130
      corner:
        minimum: ss
        typical: tt
        maximum: ff
```

- ```description: <string>```

  A global description of the parameter.

- ```display: <string>```

  A global short description to display for the parameter.

- ```unit: <string>```

  The global unit measurement of the parameter. Same format as “unit” for conditions.

- ```spec: <dictionary>```

  The target specification for the parameter (see below).

- ```tool: <list>```

  The tool which is used to run the parameter. It can either be a single name if the default settings are sufficient, or a dictionary with tool-specific settings.

- ```conditions: <dictionary>```

  All the conditions to be applied to the measurement of the parameter that are considered to be fixed with respect to the parameter result (see “variables” below).

- ```variables: <list>```

  Used for specifying display and unit attributes for results that are used for plotting.

- ```plot: <dictionary>```

  Describes how to make data plots for the parameter (where result is plotted rather than generating a single set of min/typ/max values).

### Conditions
The “conditions” dictionary entries are the same as the default_conditions dictionary, above. The default_conditions dictionary is applied to every condition before adding or overwriting with the specific conditions listed for the parameter. Conditions are only meaningful when the condition name exists as a placeholder in the template file. 

Example entry:  

```bash
 conditions:
      temperature:
        minimum: -40
        typical: 27
        maximum: 130
      corner:
        minimum: ss
        typical: tt
        maximum: ff
```

### Tool  
For an overview of which tools are currently supported by CACE, please have a look at [Supported Tools.](https://cace.readthedocs.io/en/latest/reference_manual/tools.html)  

Example entry:  

```bash
tool:
       ngspice:
        template: dc.sch
        format: ascii
        suffix: .data
        variables: [null, Vin, Vout]
        jobs: 4
```

The toolname specififes which tool is used by CACE. Each tool may stay on its own or accept a range of arguments to change its behavior.  

### Variables 
Variable entries are used for plotting to specify the `display` and `unit` entry of results.  

Example entry:  

```bash
variables:
      Vin:
        display: Vin
        unit: V
      Vout:
        display: Vout
        unit: V
```

- ```display: <string>```
  This value is text to display on the graph.

- ```unit: <value>```

  This is the unit that will be displayed after the display string.

### Plots  
Example entry:  

```bash
plot:
      dc:
        suffix: .svg
        xaxis: Vin
        yaxis: Vout
```

- ```type: <string>``` (optional)

  The type of plot to make. If this record is missing from the dictionary, then plot type “xyplot” is assumed by default. Otherwise, the value should be one of “xyplot”, “histogram”, “semilogx”, “semilogy”, or “loglog”.

- ```xaxis: <name>```

  Variable to be plotted on the graph X axis.

- ```Variable to be plotted on the graph X axis.```

  Variables to be plotted on the graph Y axis.

- ```title: <string>``` (optional)

  A title for the graph.

- ```limits: <false|true|auto>``` (optional)

  - ```false``` - do not show limits
 
  - ```true``` - always show limits
 
  - ```auto``` - show limits if they are in the range
 
    The default setting for limits is ```auto```.

  Plots are made from measured columnar data which may be from a ```“wrdata”``` command in ngspice or an ```“echo”``` statement directed to a file.

## Template Format  
Schematics are drawn normally but statements can have special syntax that is substituted by CACE. The syntax follows three essential rules:  

1.Condition and variable names in the project specification file are written in the schematic in braces prefixed with “CACE”, so “temperature” in the project file is “CACE{temperature}” in the schematic.

2.Expressions involving equations using condition and variable names are written in the schematic in brackets prefixed with “CACE”, so, for example, half of condition vdd would be written “CACE[CACE{vdd} / 2]”. These expressions are evaluated in python, so any arithmetic python expression that evaluates to a valid result may appear inside the brackets.  

3.There are a handful of reserved variable names that are automatically substituted by CACE if they appear in the schematic:

- ```CACE{filename}```

  The root name of the schematic file.

- ```CACE{simpath}```

  The path to the simulation directory.

- ```CACE{root}```

  The root path of the project.

- ```CACE{DUT_path}```

  The full path to the DUT subcircuit definition netlist.

- ```CACE{DUT_name}```

  The name of the DUT subcircuit

- ```CACE{netlist_source}```

  The current netlist source such as: schematic, layout, pex or rcx.

- ```CACE{jobs}```

  The number of jobs (threads) allocated for this simulation run. Should be used to set num_threads.

- ```CACE{PDK_ROOT}```

  The path to the directory containing the PDK

- ```CACE{PDK}```

  The name of the PDK

- ```CACE{N}```

  This is substituted with the simulation index. Most often used as a filename suffix for the output data file.

- ```CACE{random}```

  A random integer number.

- ```CACE{cond=value}```

   For any condition cond, this form indicates that "value" is to be subsituted for the condition if the condition is not declared in the CACE project file.

- ```CACE{cond|minimum}``` ```{cond|maximum}``` ```{cond|stepsize}``` ```{cond|steps}```

  Instead of substituting one value for a condition, a value over all conditions is substituted, including the maximum over all conditions, minimum over all conditions, the step size between neighboring condition values, or the number of steps over all values of the condition. This is used most often in cases where a condition is handled entirely inside a testbench netlist (such as in a sweep), and not iterated over multiple netlists.

## [Supported Tools](https://cace.readthedocs.io/en/latest/reference_manual/tools.html)
## CACE Setup for an inverter  
This tutorial will guide you step by step through the creation of a simple inverter and the CACE setup for it. It is assumed that you have already set up CACE and its dependencies.  
