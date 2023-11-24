TOPDIR = releases
VERSION = $(shell jq -r .Version manifest.json)
OUTZIP = $(TOPDIR)\Combined Girl Mod-$(VERSION).7z
DEPS = manifest.json content.json README.txt LICENSE assets content i18n
MODDIR = Combined Girl Mod

$(OUTZIP): $(DEPS)
	xcopy manifest.json '$(MODDIR)\'
	xcopy content.json '$(MODDIR)\'
	xcopy README.txt '$(MODDIR)\'
	xcopy LICENSE '$(MODDIR)\'
	xcopy assets\ '$(MODDIR)\assets\' /S
	xcopy content\ '$(MODDIR)\content\' /S
	xcopy i18n\ '$(MODDIR)\i18n\' /S
	7z a '$(OUTZIP)' '$(MODDIR)'
	rd /s/q "$(MODDIR)"

.PHONY: clean

clean:
	del "$(OUTZIP)"