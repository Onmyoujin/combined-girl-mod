TOPDIR = releases/
VERSION := $(shell eval 'jq -r .Version manifest.json')
OUTZIP = $(TOPDIR)Combined Girl Mod-$(VERSION).7z
DEPS = manifest.json content.json README.txt LICENSE assets content

$(OUTZIP): $(DEPS)
	7z a '$(OUTZIP)' $(DEPS)

.PHONY: clean

clean:
	rm '$(OUTZIP)'