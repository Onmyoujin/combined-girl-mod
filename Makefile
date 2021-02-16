TOPDIR = releases/
VERSION := $(shell eval 'jq -r .Version manifest.json')
OUTZIP = $(TOPDIR)Combined Girl Mod-$(VERSION).7z
DEPS = manifest.json content.json README.txt CONTRIBUTING.md LICENSE assets content i18n
MODDIR = Combined Girl Mod

$(OUTZIP): $(DEPS)
	mkdir '$(MODDIR)'
	cp -r $(DEPS) '$(MODDIR)'
	7z a '$(OUTZIP)' '$(MODDIR)'
	rm -rf '$(MODDIR)'

.PHONY: clean

clean:
	rm '$(OUTZIP)'