# $FreeBSD: head/Mk/Uses/bison.mk 369465 2014-09-28 16:36:31Z tijl $
#
# handle dependency on the bison port
#
# Feature:	bison
# Usage:	USES=bison or USES=bison:ARGS
# Valid ARGS:	build (default, implicit), run, both
#
# MAINTAINER: portmgr@FreeBSD.org

.if !defined(_INCLUDE_USES_BISON_MK)
_INCLUDE_USES_BISON_MK=	yes

_BISON_DEPENDS=	bison:${PORTSDIR}/devel/bison

.if empty(bison_ARGS)
bison_ARGS=	build
.endif

.if ${bison_ARGS} == "build"
BUILD_DEPENDS+=	${_BISON_DEPENDS}
.elif ${bison_ARGS} == "run"
RUN_DEPENDS+=	${_BISON_DEPENDS}
.elif ${bison_ARGS} == "both"
BUILD_DEPENDS+=	${_BISON_DEPENDS}
RUN_DEPENDS+=	${_BISON_DEPENDS}
.else
IGNORE=	USES=bison - invalid args: [${bison_ARGS}] specified
.endif

.endif