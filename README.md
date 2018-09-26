# gardner

Our notes on using the CRI cluster, [gardner][gardner].

## Documentation from the CRI

See [these slides](gardner-1.pdf) and [these](gardner-2.pdf).

## Connecting to gardner

If you are on campus, to connect from the command-line shell (e.g.,
Terminal), run:

```bash
ssh userid@gardner.cri.uchicago.edu
```

where `userid` would be replaced by the name of your CRI account
(typically the same as your BSD account).

To connect to gardner off-campus, you can either log in first to an
on-campus location (e.g., midway), or you can use [cVPN][cvpn].

If you are conneting frequently, you may want to set up SSH keys for
your account, which will allow you to connect without having to type a
password every time.

## Storage

Most of your files will be stored in one of these four locations:

+ `/home`:

+ `/gpfs/data`:

+ `/group`:

+ `/scratch`:

## Using the [TORQUE][torque] job scheduler

*Nick, please add a simple interactive and non-interactive demo here,
e.g., run a computation that takes a minute or two in R.*

[gardner]: http://cri.uchicago.edu/hpc
[torque]: https://en.wikipedia.org/wiki/TORQUE
[cvpn]: https://uchicago.service-now.com/it?id=kb_article&kb=kb00015292
