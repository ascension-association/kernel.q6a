SUMMARY = "ADSP firmware symlink for Radxa Dragon Q6A"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

ALLOW_EMPTY:${PN} = "1"

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a
    ln -sf ../../adsp.mbn ${D}${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/adsp.mbn
    ln -sf ../../cdsp.mbn ${D}${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/cdsp.mbn
}

FILES:${PN} = "${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a"

RDEPENDS:${PN} = "packagegroup-rb3gen2-hexagon-dsp-binaries"