# Copyright (c) 2017 sakaki <sakaki@deciban.com>
# License: GPL v3+
# NO WARRANTY

EAPI=6

DESCRIPTION="Baseline packages for the gentoo-on-rpi3-64bit image"
HOMEPAGE="https://github.com/sakaki-/gentoo-on-rpi3-64bit"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~arm64"
IUSE="+boot-fw +kernel-bin +porthash +weekly-genup +core +xfce pitop apps"
REQUIRED_USE="
	xfce? ( core )
	pitop? ( xfce )
	apps? ( xfce )"

# required by Portage, as we have no SRC_URI...
S="${WORKDIR}"

DEPEND="
	>=sys-apps/openrc-0.21
	>=app-shells/bash-4.0"
RDEPEND="
	${DEPEND}
	kernel-bin? (
		boot-fw? (
			>=sys-kernel/bcmrpi3-kernel-bin-4.9.30.20170601[with-matching-boot-fw(-),pitop(-)?]
		)
		!boot-fw? (
			>=sys-kernel/bcmrpi3-kernel-bin-4.9.30.20170601[-with-matching-boot-fw(-)]
		)
	)
	!kernel-bin? (
		boot-fw? (
			>=sys-boot/rpi3-64bit-firmware-1.20161215-r2[pitop(-)?]
		)
		!boot-fw? (
			!sys-boot/rpi3-64bit-firmware
		)
	)
	>=net-wireless/rpi3-bluetooth-1.1-r4
	>=sys-apps/rpi3-init-scripts-1.1.4
	>=sys-apps/rpi3-ondemand-cpufreq-1.1.1
	>=sys-firmware/b43-firmware-5.100.138
	>=sys-firmware/bluez-firmware-1.2
	>=sys-firmware/brcm43430-firmware-20160225
	porthash? ( >=app-portage/rpi3-check-porthash-1.0.0-r3 )
	weekly-genup? ( >=app-portage/weekly-genup-1.0.1 )
	!weekly-genup? ( !app-portage/weekly-genup )
	core? (
		>=app-admin/logrotate-3.13.0
		>=app-admin/sudo-1.8.21_p2
		>=app-admin/syslog-ng-3.7.3
		>=app-arch/lzop-1.04
		>=app-crypt/gnupg-2.2.4
		>=app-editors/nano-2.9.2
		>=app-editors/vim-8.0.1428
		>=app-editors/vim-core-8.0.1428
		>=app-misc/screen-4.6.2
		>=app-portage/eix-0.33.0-r1
		>=app-portage/euses-2.5.9
		>=app-portage/gentoolkit-0.4.1
		>=app-portage/genup-1.0.15
		>=app-portage/mirrorselect-2.2.3
		>=app-portage/porthash-1.0.5
		>=app-portage/showem-1.0.3
		>=app-text/dos2unix-7.4.0
		>=app-text/psutils-1.17-r3
		>=dev-embedded/wiringpi-2.44-r7
		>=dev-libs/elfutils-0.170-r1
		>=dev-python/pip-9.0.1-r2
		>=dev-tcltk/expect-5.45
		>=dev-util/strace-4.20
		>=dev-vcs/git-2.15.1
		>=mail-client/mailx-8.1.2.20160123
		>=mail-client/mailx-support-20060102-r2
		>=media-sound/alsa-tools-1.1.5
		>=net-analyzer/iptraf-ng-1.1.4-r2
		>=net-analyzer/nmap-7.60
		>=net-analyzer/tcpdump-4.9.2
		>=net-irc/irssi-1.0.6
		>=net-misc/bridge-utils-1.6
		>=net-misc/chrony-3.2
		>=net-misc/dhcpcd-7.0.0
		>=net-misc/iperf-3.3
		>=net-misc/keychain-2.8.4
		>=net-misc/networkmanager-1.10.2
		>=net-misc/networkmanager-openvpn-1.8.0-r1
		>=net-vpn/openvpn-2.4.4
		>=net-wireless/iw-4.9
		|| ( >=sys-apps/util-linux-2.31.1 >=net-wireless/rfkill-0.5-r1 )
		>=net-wireless/wireless-tools-30_pre9
		>=net-wireless/wpa_supplicant-2.6-r3
		>=sys-apps/ack-2.18-r1
		>=sys-apps/coreboot-utils-4.6
		>=sys-apps/flashrom-0.9.9
		>=sys-apps/hdparm-9.53
		>=sys-apps/i2c-tools-4.0
		>=sys-apps/me_cleaner-1.1
		>=sys-apps/mlocate-0.26-r2
		>=sys-apps/smartmontools-6.6
		>=sys-apps/usbutils-009
		>=sys-devel/distcc-3.2_rc1-r4
		>=sys-fs/btrfs-progs-4.14.1
		>=sys-fs/dosfstools-4.1
		>=sys-fs/eudev-3.2.5
		>=sys-fs/fuse-2.9.7
		>=sys-fs/multipath-tools-0.7.4
		>=sys-fs/zerofree-1.0.4
		>=sys-power/powertop-2.8
		>=sys-process/cronie-1.5.1
		>=sys-process/iotop-0.6
	)
	xfce? (
		>=app-accessibility/onboard-1.4.1
		>=app-office/orage-4.12.1-r1
		>=media-fonts/cantarell-0.0.25
		>=media-fonts/croscorefonts-1.31.0
		>=media-fonts/fontawesome-4.7.0
		>=media-fonts/libertine-5.3.0.20120702-r2
		>=media-fonts/ttf-bitstream-vera-1.10-r3
		>=media-libs/mesa-17.3.1
		>=net-wireless/blueman-2.0.4
		>=sci-calculators/qalculate-gtk-0.9.9
		>=sci-calculators/speedcrunch-0.12.0
		>=x11-apps/mesa-progs-8.3.0
		>=x11-apps/xclock-1.0.7
		>=x11-apps/xdm-1.1.11-r3
		>=x11-apps/xev-1.2.2
		>=x11-apps/xmodmap-1.0.9
		>=x11-apps/xsetroot-1.1.1
		>=x11-base/xorg-server-1.19.6
		>=x11-misc/lightdm-1.24.0-r1
		>=x11-misc/lightdm-gtk-greeter-2.0.3
		>=x11-misc/rpi3-safecursor-1.0.0
		>=x11-misc/twofing-0.1.2-r2
		>=x11-misc/xdiskusage-1.51
		>=x11-terms/xfce4-terminal-0.8.6
		>=x11-terms/xterm-331
		>=xfce-base/xfce4-meta-4.12-r1
		>=xfce-extra/thunar-archive-plugin-0.3.1-r3
		>=xfce-extra/thunar-volman-0.9.0
		>=xfce-extra/tumbler-0.2.0
		>=xfce-extra/xfce4-alsa-plugin-0.1.1
		>=xfce-extra/xfce4-cpufreq-plugin-1.1.90
		>=xfce-extra/xfce4-cpugraph-plugin-1.0.5
		>=xfce-extra/xfce4-fixups-rpi3-1.0.2
		>=xfce-extra/xfce4-indicator-plugin-2.3.3-r2
		>=xfce-extra/xfce4-mixer-4.99.0-r1
		>=xfce-extra/xfce4-notes-plugin-1.8.1
		>=xfce-extra/xfce4-power-manager-1.6.1
		>=xfce-extra/xfce4-screenshooter-1.9.1
		>=xfce-extra/xfce4-systemload-plugin-1.2.1
		>=xfce-extra/xfce4-taskmanager-1.2.0
	)
	pitop? (
		>=dev-embedded/pitop-speaker-1.1.0.1
		>=sys-apps/pitop-poweroff-1.0.2-r5
		>=xfce-extra/xfce4-battery-plugin-1.1.0-r1[pitop]
		>=xfce-extra/xfce4-keycuts-pitop-1.0.1
	)
	apps? (
		>=app-arch/p7zip-16.02-r1
		>=app-crypt/seahorse-3.20.0
		>=app-editors/emacs-25.3
		>=app-editors/mousepad-0.4.0-r1
		>=app-office/libreoffice-5.4.4.2-r1
		>=app-office/libreoffice-l10n-5.4.4.2
		>=app-portage/porthole-0.6.1-r4
		>=app-text/evince-3.24.2
		>=dev-util/meld-3.18.0
		>=mail-client/claws-mail-3.16.0
		>=mail-client/thunderbird-52.5.2
		>=media-gfx/gimp-2.9.8-r1
		>=media-gfx/ristretto-0.8.2_p20170821
		>=media-tv/kodi-17.4_rc1
		>=media-video/mplayer-1.3.0-r3
		>=media-video/smplayer-17.12.0
		>=media-video/vlc-2.2.8-r1
		>=net-irc/hexchat-2.12.4-r2
		>=sys-apps/gnome-disk-utility-3.24.1
		>=sys-apps/qdiskusage-1.0.4
		>=sys-devel/portage-distccmon-gui-1.0
		>=www-client/firefox-56.0
		>=www-client/links-2.14
		dev-java/icedtea:8
	)
"

src_install() {
	# basic framework file to enable / disable USE flags for this package
	insinto "/etc/portage/package.use/"
	newins "${FILESDIR}/package.use_${PN}-1" "${PN}"
}

pkg_postinst() {
	# ensure we have at least a system JVM set (if javac installed)
	if [ -e /usr/bin/javac ] && ! /usr/bin/javac -version &>/dev/null; then
		if eselect java-vm set system 1 &>/dev/null; then
			ewarn "Your JVM setup is now as follows:"
			ewarn "$(eselect java-vm show)"
			ewarn "Please modify (using eselect java-vm set ...) if incorrect"
		fi
	fi
}

