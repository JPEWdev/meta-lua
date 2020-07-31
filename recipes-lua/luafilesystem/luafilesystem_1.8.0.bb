SUMMARY = "Lua library to complement the builtin file system API"
HOMEPAGE = "https://keplerproject.github.io/luafilesystem/"
LICENSE = "MIT"
SECTION = "lua"
LIC_FILES_CHKSUM = "file://LICENSE;md5=d9b7e441d51a96b17511ee3be5a75857"

SRC_URI = "\
    git://github.com/keplerproject/luafilesystem.git;protocol=https;branch=${BRANCH} \
    file://run-ptest \
    "
SRCREV = "7c6e1b013caec0602ca4796df3b1d7253a2dd258"
BRANCH = "master"

S = "${WORKDIR}/git"

inherit rockspec ptest

do_install_ptest() {
    install -d ${D}${PTEST_PATH}/tests
    install -m 0755 ${S}/tests/*  ${D}${PTEST_PATH}/tests/
}

