This blog will show details of LSCPU commands, how can we use this to know CPU info.

### Options

```
 Usage:
 lscpu [options]

Display information about the CPU architecture.

Options:
 -a, --all               print both online and offline CPUs (default for -e)
 -b, --online            print online CPUs only (default for -p)
 -B, --bytes             print sizes in bytes rather than in human readable format
 -C, --caches[=<list>]   info about caches in extended readable format
 -c, --offline           print offline CPUs only
 -J, --json              use JSON for default or extended format
 -e, --extended[=<list>] print out an extended readable format
 -p, --parse[=<list>]    print out a parsable format
 -s, --sysroot <dir>     use specified directory as system root
 -x, --hex               print hexadecimal masks rather than lists of CPUs
 -y, --physical          print physical instead of logical IDs
     --output-all        print all available columns for -e, -p or -C

 -h, --help              display this help
 -V, --version           display version

Available output columns for -e or -p:
           CPU  logical CPU number
          CORE  logical core number
        SOCKET  logical socket number
          NODE  logical NUMA node number
          BOOK  logical book number
        DRAWER  logical drawer number
         CACHE  shows how caches are shared between CPUs
  POLARIZATION  CPU dispatching mode on virtual hardware
       ADDRESS  physical address of a CPU
    CONFIGURED  shows if the hypervisor has allocated the CPU
        ONLINE  shows if Linux currently makes use of the CPU
        MAXMHZ  shows the maximum MHz of the CPU
        MINMHZ  shows the minimum MHz of the CPU

Available output columns for -C:
      ALL-SIZE  size of all system caches
         LEVEL  cache level
          NAME  cache name
      ONE-SIZE  size of one cache
          TYPE  cache type
          WAYS  ways of associativity
  ALLOC-POLICY  allocation policy
  WRITE-POLICY  write policy
      PHY-LINE  number of physical cache line per cache t
          SETS  number of sets in the cache; set lines has the same cache index
 COHERENCY-SIZE  minimum amount of data in bytes transferred from memory to cache

For more details see lscpu(1).
 ```