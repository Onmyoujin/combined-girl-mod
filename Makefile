TOPDIR = ../
VERSION := $(shell eval 'jq -r .Version manifest.json')
OUTZIP = $(TOPDIR)Combined_Girl_Mod_$(VERSION).7z
DEPS = manifest.json README.txt LICENSE assets content

$(OUTZIP): $(DEPS)
	7z a '$(OUTZIP)' $(DEPS)

.PHONY: clean

clean:
	rm '$(OUTZIP)'