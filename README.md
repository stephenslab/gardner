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
   `/gpfs/data/xhe-lab`). There is *a lot* of space here.

3. `/group`: Where some other labs store their files (e.g.,
   `/group/bergelson-lab`).

4. `/scratch`: Although each user has a separate directory only
   accessible to them, this is a shared file system, and there is also
   a great deal of freely available space here.

*TO DO: add info about backups.*

## Using the [TORQUE][torque] job scheduler

*Nick, please add a simple interactive and non-interactive demo here,
e.g., run a computation that takes a minute or two in R.*

[gardner]: http://cri.uchicago.edu/hpc
[cri-wiki]: https://wiki.uchicago.edu/display/public/CRI/Home
[torque]: https://en.wikipedia.org/wiki/TORQUE
[cvpn]: https://uchicago.service-now.com/it?id=kb_article&kb=kb00015292
