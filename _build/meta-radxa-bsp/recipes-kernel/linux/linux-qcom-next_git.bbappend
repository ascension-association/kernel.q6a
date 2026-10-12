# ref: https://github.com/qualcomm-linux/meta-qcom/blob/master/recipes-kernel/linux/linux-qcom-next_git.bb

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LINUX_VERSION ?= "7.2+7.3-rc2"

PV = "${LINUX_VERSION}+git"

# tag: qcom-next-7.3-rc2-20260928
SRCREV ?= "e428097a36d210c50991063f17ee0848e9eb68a8"

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
