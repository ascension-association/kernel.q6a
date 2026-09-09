# ref: https://github.com/qualcomm-linux/meta-qcom/blob/master/recipes-kernel/linux/linux-qcom-next_git.bb

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LINUX_VERSION ?= "7.2"

PV = "${LINUX_VERSION}+git"

# tag: qcom-next-7.2-20260826
SRCREV ?= "d49c33864d06e9672dce57738be8851384578fcf"

SRCBRANCH ?= "nobranch=1"
SRCBRANCH:class-devupstream ?= "branch=qcom-next"

SRC_URI = "git://github.com/qualcomm-linux/kernel.git;${SRCBRANCH};protocol=https"

SRC_URI += " \
		file://realtek-eth-8169.cfg \
		file://qcom.cfg \
		file://qcom-qcm6490.cfg \
		file://addendum.cfg \
"

KBUILD_CONFIG_EXTRA:remove:aarch64 = " ${S}/arch/arm64/configs/prune.config"
KBUILD_CONFIG_EXTRA:remove:aarch64 = " ${S}/arch/arm64/configs/qcom.config"
