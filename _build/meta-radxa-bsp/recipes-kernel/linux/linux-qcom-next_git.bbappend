# ref: https://github.com/qualcomm-linux/meta-qcom/blob/master/recipes-kernel/linux/linux-qcom-next_git.bb

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LINUX_VERSION ?= "7.0+7.1-rc7"

PV = "${LINUX_VERSION}+git"

# tag: qcom-next-7.1-rc7-20260618
SRCREV ?= "6548ba1da92711e1ba186d9d469388c9f64e654a"

SRCBRANCH ?= "nobranch=1"
SRCBRANCH:class-devupstream ?= "branch=qcom-next"

SRC_URI = "git://github.com/qualcomm-linux/kernel.git;${SRCBRANCH};protocol=https"

SRC_URI += " \
			file://realtek-eth-8169.cfg \
			file://qcom.cfg \
    		file://qcom-qcm6490.cfg \
"

KBUILD_CONFIG_EXTRA:remove:aarch64 = " ${S}/arch/arm64/configs/prune.config"
KBUILD_CONFIG_EXTRA:remove:aarch64 = " ${S}/arch/arm64/configs/qcom.config"
