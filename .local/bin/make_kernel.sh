#!/bin/bash


make_kernel() {
        echo "We are going to install a known-good kernel for you now. You"
        echo "can edit this at any time after the install procedure has finished."
        echo "In fact, you should edit it once you've booted in to the filesystem."
        echo
        read -sp "Press Enter to continue..."
        echo
        # Check if genkernel is installed
        if [[ ! -f /usr/bin/dracut ]]; then
                emerge -qv dracut
        fi
        # echo "sys-apps/kmod zstd" >> /etc/portage/package.use/kernel
        emerge -qv kmod
        zcat /proc/config.gz > /usr/src/linux/.config

        make -C /usr/src/linux -j $(nproc)
        KERNVER=$(make -C /usr/src/linux -s kernelrelease)

        make -C /usr/src/linux modules_install
        # Gentoo's GRUB expects Image and the initramfs to be
        # in pairs with the same release tag, with the tag
        # -linux taking precedence over all others. If
        # a kernel already exists with that tag, we need to
        # move it so that our kernel and initramfs become the
        # default booted
        # if [[ -e /boot/vmlinu{x,z}-linux ]]; then
        #         mv /boot/vmlinu{x,z}-linux /boot/vmlinu{x,z}-old
        # fi
        # if [[ -e /boot/initramfs-linux.img ]]; then
        #         mv /boot/initramfs-linux.img /boot/initramfs-old.img
        # fi
        make -C /usr/src/linux install
        #
        # if [[ ! -d /etc/dracut.conf.d/ ]]; then
        #         mkdir -p /etc/dracut.conf.d/
        # fi

        # cp resources/dracut.conf /etc/dracut.conf.d/10-apple.conf

        dracut \
                --force \
                --quiet \
                --kver ${KERNVER} \
                --compress gzip

        # We need to rebuild GRUB
        # grub-install --removable --efi-directory=/boot --boot-directory=/boot
        grub-mkconfig -o /boot/grub/grub.cfg
}


make_kernel
