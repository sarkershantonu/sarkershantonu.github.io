
This blog will show details of lablk commands, how can we use this to know hdd info.

### Options 

```
Usage:
 lsblk [options] [<device> ...]

List information about block devices.

Options:
 -D, --discard        print discard capabilities
 -E, --dedup <column> de-duplicate output by <column>
 -I, --include <list> show only devices with specified major numbers
 -J, --json           use JSON output format
 -O, --output-all     output all columns
 -P, --pairs          use key="value" output format
 -S, --scsi           output info about SCSI devices
 -T, --tree[=<column>] use tree format output
 -a, --all            print all devices
 -b, --bytes          print SIZE in bytes rather than in human readable format
 -d, --nodeps         don't print slaves or holders
 -e, --exclude <list> exclude devices by major number (default: RAM disks)
 -f, --fs             output info about filesystems
 -i, --ascii          use ascii characters only
 -l, --list           use list format output
 -M, --merge          group parents of sub-trees (usable for RAIDs, Multi-path)
 -m, --perms          output info about permissions
 -n, --noheadings     don't print headings
 -o, --output <list>  output columns
 -p, --paths          print complete device path
 -r, --raw            use raw output format
 -s, --inverse        inverse dependencies
 -t, --topology       output info about topology
 -z, --zoned          print zone model
 -x, --sort <column>  sort output by <column>
     --sysroot <dir>  use specified directory as system root

 -h, --help           display this help
 -V, --version        display version

Available output columns:
        NAME  device name
       KNAME  internal kernel device name
        PATH  path to the device node
     MAJ:MIN  major:minor device number
     FSAVAIL  filesystem size available
      FSSIZE  filesystem size
      FSTYPE  filesystem type
      FSUSED  filesystem size used
      FSUSE%  filesystem use percentage
       FSVER  filesystem version
  MOUNTPOINT  where the device is mounted
       LABEL  filesystem LABEL
        UUID  filesystem UUID
      PTUUID  partition table identifier (usually UUID)
      PTTYPE  partition table type
    PARTTYPE  partition type code or UUID
 PARTTYPENAME  partition type name
   PARTLABEL  partition LABEL
    PARTUUID  partition UUID
   PARTFLAGS  partition flags
          RA  read-ahead of the device
          RO  read-only device
          RM  removable device
     HOTPLUG  removable or hotplug device (usb, pcmcia, ...)
       MODEL  device identifier
      SERIAL  disk serial number
        SIZE  size of the device
       STATE  state of the device
       OWNER  user name
       GROUP  group name
        MODE  device node permissions
   ALIGNMENT  alignment offset
      MIN-IO  minimum I/O size
      OPT-IO  optimal I/O size
     PHY-SEC  physical sector size
     LOG-SEC  logical sector size
        ROTA  rotational device
       SCHED  I/O scheduler name
     RQ-SIZE  request queue size
        TYPE  device type
    DISC-ALN  discard alignment offset
   DISC-GRAN  discard granularity
    DISC-MAX  discard max bytes
   DISC-ZERO  discard zeroes data
       WSAME  write same max bytes
         WWN  unique storage identifier
        RAND  adds randomness
      PKNAME  internal parent kernel device name
        HCTL  Host:Channel:Target:Lun for SCSI
        TRAN  device transport type
  SUBSYSTEMS  de-duplicated chain of subsystems
         REV  device revision
      VENDOR  device vendor
       ZONED  zone model
         DAX  dax-capable device

```