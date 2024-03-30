To create a custom Arch Linux ISO with a pre-installed system, including customized configurations and packages, you can use the Archiso tool. Archiso allows you to build Arch Linux live/installation media with your desired configurations.

Here's a step-by-step guide to creating a custom Arch Linux ISO:

1. **Install Archiso**:
   - Ensure that you have the `archiso` package installed on your system:
     ```
     sudo pacman -S archiso
     ```

2. **Clone Archiso Configuration Files**:
   - Clone the Archiso Git repository to get the default configuration files:
     ```
     git clone https://github.com/archlinux/archiso.git
     ```

3. **Customize Archiso Configuration**:
   - Navigate to the `archiso` directory and edit the configuration files according to your requirements. Key files include:
     - `releng/packages.x86_64`: Add any additional packages you want to include in the ISO.
     - `releng/airootfs/etc`: Customize system configurations such as users, groups, network settings, and startup services.
     - `releng/airootfs/root/customize_airootfs.sh`: Add custom scripts to be executed during the ISO build process.
     - `releng/airootfs/etc/skel`: Place files in this directory to be copied to new user home directories.

4. **Build the Arch Linux ISO**:
   - Run the `build.sh` script to build the ISO image:
     ```
     ./build.sh -v
     ```
   - This will generate a custom Arch Linux ISO image in the `out` directory.

5. **Test the ISO**:
   - Test the generated ISO image in a virtual machine or on physical hardware to ensure that it boots and functions correctly.
   - Verify that your custom configurations and packages are included and working as expected.

6. **Refine and Repeat**:
   - Make any necessary adjustments to the configuration files based on testing and feedback.
   - Rebuild the ISO image and repeat the testing process until you are satisfied with the results.

7. **Documentation and Distribution**:
   - Document the customization process and any special features of your custom Arch Linux ISO.
   - Distribute the ISO image to users or publish it for public use as needed.

By following these steps, you can create a custom Arch Linux ISO with a pre-installed system, including customized configurations and packages tailored to your specific requirements. Remember to regularly update your ISO image to incorporate any changes or updates to the Arch Linux base system or your custom configurations.