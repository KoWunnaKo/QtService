TEMPLATE = aux

OTHER_FILES += Doxyfile \
	makedoc.sh \
	doxme.py \
	../README.md \
	*.dox \
	snippets/*.cpp \
	images/* \
	gh_header.html

mkpath($$OUT_PWD/qtservice)
!exists($$OUT_PWD/qtservice.qch):write_file($$OUT_PWD/qtservice.qch, __NOTHING)

docTarget.target = doxygen
docTarget.commands = $$PWD/makedoc.sh "$$PWD" "$$MODULE_VERSION" "$$[QT_INSTALL_BINS]" "$$[QT_INSTALL_HEADERS]" "$$[QT_INSTALL_DOCS]"
QMAKE_EXTRA_TARGETS += docTarget

docInst1.path = $$[QT_INSTALL_DOCS]
docInst1.files = $$OUT_PWD/qtservice.qch
docInst1.CONFIG += no_check_exist
docInst2.path = $$[QT_INSTALL_DOCS]
docInst2.files = $$OUT_PWD/qtservice
INSTALLS += docInst1 docInst2

DISTFILES += \
    serviceplugin.dox
