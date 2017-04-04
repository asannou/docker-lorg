```
$ docker run -it --rm -v $(pwd):/root asannou/lorg

[!] Specify at least an input logfile

Usage: lorg [-i input_type] [-o output_type] [-d detect_mode]
            [-a add_vector] [-c client_ident] [-b dnsbl_type]
            [-q quantification] [-t threshold] [-v verbosity]
            [-n] [-u] [-h] [-g] [-p] input_file [output_file]

 -i allowed input formats: common combined vhost logio cookie
 -o allowed output formats: html json xml csv
 -d allowed detect modes: chars phpids mcshmm dnsbl geoip all
 -a additional attack vectors: path argnames cookie agent all
 -c allowed client identfiers: host session user logname all
 -b allowed dnsbl types: tor proxy zombie spam dialup all
 -q allowed quantification types: status bytes replay all
 -t threshold level as value from 0 to n (default: 10)
 -v verbosity level as value from 0 to 3 (default: 1)
 -n do not summarize results, output single incidents
 -u urldecode encoded requests (affects reports only)
 -h try to convert numerical addresses into hostnames
 -g enable geotargeting (separate files are needed!)
 -p perform a naive tamper detection test on logfile
```
