This blog will show details of LSHW commands, how can we use this to know hardware info.

### To know about hardware 



### Options 
These are all options 

```
Hardware Lister (lshw) -
usage: lshw [-format] [-options ...]
       lshw -version

        -version        print program version ()

format can be
        -html           output hardware tree as HTML
        -xml            output hardware tree as XML
        -json           output hardware tree as a JSON object
        -short          output hardware paths
        -businfo        output bus information

options can be
        -class CLASS    only show a certain class of hardware
        -C CLASS        same as '-class CLASS'
        -c CLASS        same as '-class CLASS'
        -disable TEST   disable a test (like pci, isapnp, cpuid, etc. )
        -enable TEST    enable a test (like pci, isapnp, cpuid, etc. )
        -quiet          don't display status
        -sanitize       sanitize output (remove sensitive information like serial numbers, etc.)
        -numeric        output numeric IDs (for PCI, USB, etc.)
        -notime         exclude volatile attributes (timestamps) from output

```