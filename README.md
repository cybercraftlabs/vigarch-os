# Vigilante Arch
> A live and anonymous system for hacker, security professionals and tech geeks.

-----

## Features

- Amnesic and Live System
- Application Security
- Vast Tools Repository
- Tor Integration and Tor Browser
- Minimal Interface
- High Customizability

## Why Vigilante Arch?

While alternatives like Tails OS prioritize security and anonymity, they often lack the comprehensive suite of tools and tailored environment desired by hackers and enthusiasts. Similarly, live systems such as Kali Linux and BlackArch offer robust toolsets but may lack the anonymity features integral to Vigilante Arch. Moreover, they tend to be more bloated, compromising performance and efficiency.

## Installation and Setup
[Here]() is the wiki, for step by step setup guide and other informations.

The installation process is simple enough, a straight-forward process.
- Download the ISO [here](https://vigarch.cybercraftlabs.site/)
- Write the ISO on an USB Drive, Use `dd` for Linux and `Etcher` for Windows.
- Plug the USB and boot the live system.

> The default creds are: `elliot:elliot`

And for the setup part, There isn't any particular things, just some good practices like
- Update the repositories
```bash
sudo pacman -Syy --noconfirm
```

## tmpFS setup
As the system boots, when we are hacking, we would need some tools and packages to be installed in our live system. And if you know, By default when an live system of the Arch Linux is started, It has the default storage of 256MB named `tmpfs`. It is crucial as while running a live system, The live system copies itself on the hardware RAM. Which means we have only 256MB of live storage to work with, but it can almost immediately used up while installing any packages and tools.
So the way we get around this is to utilize a swap partition, which, in our case, can be used as the `tmpFS` to give us the amount of storage space we need to work with.

So the steps to do this relatively simple, after writing the ISO file in the USB, make sure to create a `swap` partition of your desired size to work with (8GB Recommend).

So here's the complete process:
- Write the ISO on the USB.
- Create a `swap` partition using tools like `cfdisk`, `gdisk`, `fdisk`
- Modify the partition to be of type `swapFS`
```bash
sudo mkswap <partition-name>
# sudo mkswap /dev/sda3
```
- Now boot the system.
- In the live system, you'll have an utility called `extfs` to configure the swap to be used as `tmpFS`. Just run the tool with `<partion-name>` and `<size>[G/M]`.
```bash
extfs <partition-name> <size>[G/M]
# extfs /dev/sda3 8G
```
- And now you're all set, just update the system
```bash
sudo pacman -Syyu --noconfirm
```

## Screenshots

![Main Desktop](https://raw.githubusercontent.com/cybercraftlabs/vigarch-os/main/1st.png)
![Terminal](https://raw.githubusercontent.com/cybercraftlabs/vigarch-os/main/4th.png)
![Tools](https://raw.githubusercontent.com/cybercraftlabs/vigarch-os/main/3rd.png)
![Tor](https://raw.githubusercontent.com/cybercraftlabs/vigarch-os/main/2nd.png)