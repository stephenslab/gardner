# gardner

Our notes on using the CRI cluster, [gardner][gardner].

## Documentation from the CRI

See [these slides](gardner-1.pdf) and [these](gardner-2.pdf). The CRI
also has a [Wiki][cri-wiki] with some basic information about the
gardner cluster.

## Connecting to gardner

If you are on campus, to connect to gardner from the command-line
shell (e.g., Terminal), run:

```bash
ssh userid@gardner.cri.uchicago.edu
```

where `userid` would be replaced by the name of your CRI account
(typically the same as your BSD account, although not always).

To connect to gardner off-campus, you can either log in first to an
on-campus location (e.g., midway), or you can use [cVPN][cvpn].

If you are connecting frequently, you may want to set up SSH keys for
your account, which will allow you to connect without having to type a
password every time.

## Storage

Most of your files will be stored in one of these four locations:

1. `/home`: Where your home directory is located. Not a lot of space.

2. `/gpfs/data`: Where many labs store their files (e.g.,
   `/gpfs/data/xhe-lab`). There is *a lot* of space here. You can use
   `df` to check how much space is left in an individual directory, e.g.,

    ```bash
    df -h /gpfs/data/xhe-lab
    ```

3. `/group`: Where some other labs store their files (e.g.,
   `/group/bergelson-lab`).

4. `/scratch`: Although each user has a separate directory only
   accessible to them, this is a shared file system, and there is also
   a great deal of freely available space here.

*TO DO: add info about backups.*

## Software

The gardner cluster uses [Lmod][lmod] to organize the many different
versions of software that have been installed. It may seem a little
complicated at first, but isn't too bad once you start using it.

For example, suppose you want to use R. First, find out which versions
of R are available, run

```bash
module spider R
```

You will likely see that several versions of R are available. Suppose
you want to use R version 3.3.3. Next, run

```bash
module spider R/3.3.3
```

It should tell you that you will need to first load two modules,
gcc 6.2.0 and mpich 3.2, in order to use R 3.3.3. Go ahead and load
these modules:

```bash
module load gcc/6.2.0 mpich/3.2 R/3.3.3
```

Now you are ready to use R.

Because you can only have one version of a module loaded at a time, unloading the `R` module is as simple as 

```bash
module unload R
```

To unload _all_ modules,:

```bash
module purge
```

To see all currently loaded modules:

```bash
module list
```


## Using the TORQUE job scheduler

+ Gardner uses [TORQUE][torque].

`qsub` is the main command that's used for interacting with the job scheduler. It can be used to submit interactive jobs as well as batch jobs

### Using `qsub` interactively
To obtain a 5 hour interactive session on a compute node with (at least) 32Gb of RAM and 12 CPU cores (on 1 compute node) use the following syntax
```bash
qsub -I -l walltime=05:00:00 -l nodes=1:ppn=12 -l mem=32Gb
```

Keep in mind that modules loaded in the login load are _not_ automatically loaded.

```console
user@cri16in002:~:module load gcc/6.2.0 R/3.5.0
user@cri16in002:~:module list

Currently Loaded Modules:
  1) gcc/6.2.0   2) java-jdk/1.8.0_92   3) zlib/1.2.8   4) bzip2/1.0.6   5) xz/5.2.2   6) curl/7.51.0   7) pcre/8.39   8) R/3.5.0


user@cri16in002:~:qsub -I -l walltime=01:00:00 -l nodes=1:ppn=1 -l mem=1Gb 
qsub: waiting for job 11277124.cri16sc001 to start
qsub: job 11277124.cri16sc001 ready

user@cri16cn053:~:module list
No modules loaded

```

### Using `qsub` for batch jobs

Batch jobs are also submitted with qsub.  The only differences are 1) the `-I` flag is omitted, and 2) that is that it's customary to specify job requirements in the batch file itself.  Here's an example:

```console
user@cri16in002:~:qsub Rprof.sh
11277362.cri16sc001
```

And here's what `Rprof.sh` might look like:

```bash
#!/bin/bash                                                                                                                                                                                                                                  
#PBS -N R_Benchmark #-N names the job                                                                          
#PBS -S /bin/bash   #-S indicates which shell we want                                                         
#PBS -l mem=3gb     #-l is used for specifying requirements                                                   
#PBS -l walltime=00:10:00 
#PBS -l nodes=1:ppn=10                                                                                                                                                                                                                       


#Below the #PBS directives                                                                                                                                                                                                                   

module load gcc/6.2.0 R/3.5.0
#This runs a classic R benchmark, but first we have to make sure we've installed install a package                                                                                                                                           
R --slave -e 'if(!require("SuppDists")){install.packages("SuppDists")}'

R --slave -e 'source("https://raw.githubusercontent.com/jtalbot/riposte/master/benchmarks/other/R-benchmark-25.R")'

#Another way to run the same benchmark is to download it first with `wget` and then use Rscript/R CMD BATCH                                                                                                                                  
wget https://raw.githubusercontent.com/jtalbot/riposte/master/benchmarks/other/R-benchmark-25.R -O /tmp/R-benchmark-25.R

Rscript /tmp/R-benchmark-25.R
```




[gardner]: http://cri.uchicago.edu/hpc
[cri-wiki]: https://wiki.uchicago.edu/display/public/CRI/Home
[torque]: https://en.wikipedia.org/wiki/TORQUE
[cvpn]: https://uchicago.service-now.com/it?id=kb_article&kb=kb00015292
[lmod]: http://lmod.readthedocs.org
