PACKAGE = meego-ssh-tools
VERSION = 0.1

SOURCE_TARGETS = \
	meego-scp \
	meego-ssh \
	meego-ssh-setup \
	meego-ssh-install-authorized-key

TARGET_TARGETS = \
	meego-ssh-setup-target

EXTRA_DIST = \
	COPYING \
	README

all:
	@echo "Run make install-dev to install the devel scripts or run"
	@echo "./meego-ssh-setup-target to setup the host/target machine."

install-dev: $(SOURCE_TARGETS)
	mkdir -p "$$HOME/bin"
	for target in $(SOURCE_TARGETS); do \
		install -m 0755 "$$target" "$$HOME/bin"; \
	done

dist:
	mkdir $(PACKAGE)-$(VERSION)
	cp \
		$(SOURCE_TARGETS) \
		$(TARGET_TARGETS) \
		$(EXTRA_DIST) \
		Makefile \
		$(PACKAGE)-$(VERSION)
	tar cfj $(PACKAGE)-$(VERSION).tar.bz2 $(PACKAGE)-$(VERSION)
	rm -rf $(PACKAGE)-$(VERSION)
