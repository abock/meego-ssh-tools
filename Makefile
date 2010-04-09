SOURCE_TARGETS = \
	meego-scp \
	meego-ssh \
	meego-ssh-setup \
	meego-ssh-install-authorized-key

TARGET_TARGETS = \
	meego-ssh-setup-target

all:
	@echo "Run make install-dev to install the devel scripts or run"
	@echo "./meego-ssh-setup-target to setup the host/target machine."

install-dev: $(SOURCE_TARGETS)
	mkdir -p "$$HOME/bin"
	for target in $(SOURCE_TARGETS); do \
		install -m 0755 "$$target" "$$HOME/bin"; \
	done
