SUMMARY = "POSIX binding for Lua"
HOMEPAGE = "https://github.com/luaposix/luaposix"
LICENSE = "MIT"
SECTION = "lua"
LIC_FILES_CHKSUM = "file://LICENSE;md5=71690c320e7bd75799e67e43234bbf4f"

DEPENDS = "virtual/crypt"

SRC_URI = "\
    git://github.com/luaposix/luaposix.git;protocol=http;nobranch=1 \
    "
SRCREV = "76befd71c632b6bb8bae0879f87cabaa24b7fa8f"

S = "${WORKDIR}/git"

inherit rockspec

