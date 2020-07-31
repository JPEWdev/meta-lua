# Builds a lua module from a rockspec file

DEPENDS += "lua-native luarocks-native lua"

B = "${WORKDIR}/build"

LUAROCKS_ROCKSPEC ?= ""

export LUAROCKS_CONFIG = "${WORKDIR}/config.lua"

rockspec_do_configure() {
    cat <<HEREDOC > ${LUAROCKS_CONFIG}
rocks_trees = {
    "${STAGING_DIR_TARGET}${prefix}",
    "${B}${prefix}",
    }

external_deps_dirs = {
    "${STAGING_DIR_TARGET}${prefix}",
    "${STAGING_DIR_TARGET}",
    }

deps_mode = "none"

variables = {
    LUA = "${STAGING_BINDIR_NATIVE}/lua",
    LUA_BINDIR = "${STAGING_BINDIR}",
    LUA_INCDIR = "${STAGING_INCDIR}",
    LUA_LIBDIR = "${STAGING_LIBDIR}",
    CC = "$CC",
    LD = "$CCLD",
    CFLAGS = "$CFLAGS",
    LDFLAGS = "$LDFLAGS",
    }
HEREDOC

    lua ${STAGING_BINDIR_NATIVE}/luarocks config
}

rockspec_do_compile() {
    cd ${S}
    lua ${STAGING_BINDIR_NATIVE}/luarocks make ${LUAROCKS_ROCKSPEC}
}

rockspec_do_install() {
    cd ${B}
    tar --no-same-owner -cpf - . \
        | tar --no-same-owner -xpf - -C ${D}
}

FILES_${PN} = "${bindir} ${libdir}/lua/ ${datadir}/lua/"
FILES_${PN}-doc = "${libdir}/luarocks/"

EXPORT_FUNCTIONS do_install do_configure do_compile
