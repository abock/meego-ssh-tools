PACKAGE = meego-ssh-tools
VERSION = 0.3

SOURCE_TARGETS = \
	meego-scp \
	meego-ssh \
	meego-screenshot \
	meego-ssh-setup \
	meego-ssh-install-authorized-key

all:
	@echo "Run make install-dev to install the devel scripts or run"
	@echo "./meego-ssh-setup-target to setup the host/target machine."

install-dev: $(SOURCE_TARGETS)
	mkdir -p "$$HOME/bin"
	for target in $(SOURCE_TARGETS); do \
		install -m 0755 "$$target" "$$HOME/bin"; \
	done

dist:
	git archive --format=tar --prefix=$(PACKAGE)-$(VERSION)/ HEAD \
		| bzip2 -f > $(PACKAGE)-$(VERSION).tar.bz2

git-tag:
	git tag -a -m "$(PACKAGE) $(VERSION) release" "$(VERSION)"
	git push origin "$(VERSION)"

