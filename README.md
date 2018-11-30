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

Gardner uses [TORQUE][torque]. "qsub" is the main command that's used
for interacting with the job scheduler. It can be used to request
interactive sessions, or submit jobs.

### Requesting an interactive session

In this example, we request a 5-hour interactive session on a compute
node with 32 GB memory and 12 CPUs:

```bash
qsub -I -l walltime=05:00:00 -l nodes=1:ppn=12 -l mem=32gb
```

Keep in mind that if you load modules in a login node, these modules
will not automatically be loaded in a compute node.

### Submitting a job using qsub

We have provided [a short example script][demo.sh] in which the qsub
options are specified inside the script. In this example, we request a
compute node with 10 CPUs and 3 GB of memory, and at most 10 minutes
of runtime.

To run this job, you will first need to install the
[SuppDists][suppdists] package in R. Once you have don this, to submit
this job to the scheduler, simply run the following from the root
directory of this repository:

```R
qsub demo.sh
```

[gardner]: http://cri.uchicago.edu/hpc
[cri-wiki]: https://wiki.uchicago.edu/display/public/CRI/Home
[torque]: https://en.wikipedia.org/wiki/TORQUE
[cvpn]: https://uchicago.service-now.com/it?id=kb_article&kb=kb00015292
[lmod]: http://lmod.readthedocs.org
[suppdists]: https://cran.r-project.org/package=SuppDists
