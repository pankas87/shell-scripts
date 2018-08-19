# Find the currently running kernel
uname -r

# List all the kernels, including the booted one (4.2.0-21-generic in this example), in the package database and their statuses.
dpkg -l | tail -n +6 | grep -E 'linux-image-[0-9]+'

# To free space in /boot we'll remove an initrd.img file for a suitable old kernel manually
sudo update-initramfs -d -k [kernel-version-number]

# Now we'll use dpkg in order to TRY to purge the kernel package for the same old kernel:
sudo dpkg --purge linux-image-[kernel-version-number]

# The previous command will probably fail, as there probably is a depending linux-image-extra package installed 
# together with a 'generic' kernel package. In general, the output of the previous command 
# will tell which package you need to remove first
sudo dpkg --purge linux-image-[kernel-version-number] linux-image-extra-[kernel-version-number]