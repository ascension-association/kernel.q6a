# gokrazy kernel: upstream Linux for Radxa Dragon Q6A (Qualcomm ARM64)

This repository holds a pre-built Linux kernel image for the [Radxa Dragon Q6A](https://radxa.com/products/dragon/q6a/) SBC, used by
the [gokrazy](https://gokrazy.org/) project.

The files in this repository are picked up automatically by
the `gok` tool, so you don’t need to interact with this repository
unless you want to update the kernel to a custom version.

## gokrazy kernel repository map

| repository                         | source         | devices                       |
|------------------------------------|----------------|-------------------------------|
| [gokrazy/kernel.rpi]               | [Raspberry Pi] | Pi 3, Pi 4, Pi 5, Pi Zero 2 W |
| [gokrazy/kernel]                   | [kernel.org]   | Pi 3, Pi 4, Pi Zero 2 W       |
| [gokrazy/kernel.amd64]             | [kernel.org]   | PC x86_64, VMs                |
| [gokrazy/kernel.arm64]             | [kernel.org]   | PC arm64, VMs                 |
| [ascension-association/kernel.q6a] | [Qualcomm]     | Radxa Dragon Q6A              |

[Raspberry Pi]: https://github.com/raspberrypi/linux
[kernel.org]: https://kernel.org/
[gokrazy/kernel.rpi]: https://github.com/gokrazy/kernel.rpi
[gokrazy/kernel]: https://github.com/gokrazy/kernel
[gokrazy/kernel.amd64]: https://github.com/gokrazy/kernel.amd64
[gokrazy/kernel.arm64]: https://github.com/gokrazy/kernel.arm64
[ascension-association/kernel.q6a]: https://github.com/ascension-association/kernel.q6a
[Qualcomm]: https://github.com/qualcomm-linux/kernel

## Updating the kernel

First, install dependencies:

```
sudo pacman -S --needed git python3 python-pipx
# or: sudo apt-get install git python3 pipx
pipx install kas
pipx ensurepath
```

Clone the kernel git repository:
```
git clone --depth=1 https://github.com/ascension-association/kernel.q6a
cd kernel.q6a
```

And build a new kernel (takes about 10 minutes):
```
(cd _build && ./_build.sh)
```

The new kernel is stored in the working directory. Use `gok edit` to
add the `"KernelPackage": "github.com/ascension-association/kernel.q6a",` entry above the `Hostname` line.

## References & Thanks

- [Navin Reddy tutorial](https://rootcommit.com/2026/board-bring-up-radxa-dragon-q6a-with-mainline-linux-and-yocto/)
- [Gokrazy kernel.arm64](https://github.com/gokrazy/kernel.arm64)
- [Qualcomm Linux](https://github.com/qualcomm-linux/meta-qcom/blob/master/recipes-kernel/linux/linux-qcom-next_git.bb)
  
