# Vigilante Arch
> A live and anonymous system for hackers, security professionals, and tech geeks.

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
[Here](https://github.com/cybercraftlabs/vigarch-os/wiki) is the wiki, for step by step setup guide and other pieces of information.

The installation process is simple enough, a straightforward process.
- Download the ISO [here](https://github.com/cybercraftlabs/vigarch-os/releases/download/latest/vigarch-latest-x86_64.iso)
- Write the ISO on a USB Drive, Use `dd` for Linux and `Etcher` for Windows.
- Plug the USB and boot the live system.

> The default creds are: `elliot:elliot`

And for the setup part, There aren't any particular things, just some good practices like
- Update the repositories
```bash
sudo pacman -Syy --noconfirm
```

## tmpFS setup
As the system boots, when we are hacking, we would need some tools and packages to be installed in our live system. And if you know, By default when a live system of Arch Linux is started, It has the default storage of 256MB named `tmpfs`. It is crucial as while running a live system, The live system copies itself on the hardware RAM. This means we have only 256MB of live storage to work with, but it can almost immediately used up while installing any packages and tools.
So the way we get around this is to utilize a swap partition, which, in our case, can be used as the `tmpFS` to give us the amount of storage space we need to work with.

So the steps to do this are relatively simple, after writing the ISO file in the USB, make sure to create a `swap` partition of your desired size to work with (8GB Recommend).

So here's the complete process:
- Write the ISO on the USB.
- Create a `swap` partition using tools like `cfdisk`, `gdisk`, `fdisk`
- Modify the partition to be of type `swapFS`
```bash
sudo mkswap <partition-name>
# sudo mkswap /dev/sda3
```
- Now boot the system.
- In the live system, you'll have a utility called `extfs` to configure the swap to be used as `tmpFS`. Just run the tool with `<partion-name>` and `<size>[G/M]`.
```bash
extfs <partition-name> <size>[G/M]
# extfs /dev/sda3 8G
```
- And now you're all set, just update the system
```bash
sudo pacman -Syyu --noconfirm
```

## Tor Setup

### Approach

When it comes to TOR integration and setup, Vigilante Arch OS takes a slightly different approach compared to TailsOS. While TailsOS provides a prompt to set up TOR either for the entire system or specifically for the browser and certain applications, our approach caters more to the needs of hackers, security professionals, and enthusiasts.

### Considerations

In our line of work, whether conducting reconnaissance or research, tasks often involve significant time and generate considerable network traffic. Relying solely on TOR for all these activities can quickly raise suspicion among network administrators due to the noticeable increase in TOR traffic. To address this, we adopt a more strategic approach:

- **TOR Browser Default**: The TOR Browser is configured to use TOR by default, ensuring anonymity for web browsing activities.
  
- **Selective Proxying**: For other applications and utilities, we employ `proxychains` to selectively route traffic through TOR, avoiding unnecessary attention and potential suspicion.

### Implementation

Within the live system, we've simplified the process by creating an alias named `vig` with the additional configuration for maximized anonymity, for configuring `proxychains` through TOR. Here's how you can utilize it:

1. **Start TOR Service**: Initiate the TOR service using the `vigilante` alias:
```bash
vigilante
```

2. **Monitor Network Activity**: Keep track of network bandwidth and ensure maximum anonymity using the `nyx` utility:
```bash
nyx
```

3. **Proxy Commands Through TOR**: Utilize the `vig` alias (*proxychains*) to run commands through TOR:
```bash
vig <command-to-be-proxied-through-tor>

# Example:
vig curl -v https://check.torproject.org
```
However, in the upcoming updates, we are going to also provide users with a prompt to either use this approach or just utilize the `tor` setup systemwide.

By following these steps, you can effectively leverage TOR for specific tasks while maintaining discretion and anonymity, essential in the realm of cybersecurity and privacy.

## Screenshots

![Main Desktop](https://raw.githubusercontent.com/cybercraftlabs/vigarch-os/main/screenshots/1st.png)
![Terminal](https://raw.githubusercontent.com/cybercraftlabs/vigarch-os/main/screenshots/4th.png)
![Tools](https://raw.githubusercontent.com/cybercraftlabs/vigarch-os/main/screenshots/3rd.png)
![Tor](https://raw.githubusercontent.com/cybercraftlabs/vigarch-os/main/screenshots/2nd.png)
