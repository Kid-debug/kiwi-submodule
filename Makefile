HELM_VERSION = v13.2
PATCH_APPLY_VERSION ?= v13.2
PATCH_APPLY_DIRECTORY ?= helm_v13.2/

.PHONY: create-patch
create-patch:
	diff -ruN ./helm_ori_v13.2 ./helm > ./patch/kiwi_$(HELM_VERSION).patch || exit 0

.PHONY: patch-helm
patching:
	-patch --directory=$(PATCH_APPLY_DIRECTORY) -p2 < ./patch/kiwi_$(PATCH_APPLY_VERSION).patch
