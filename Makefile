LATEST_KIWI_VERSION ?= v13.2
PATCH_APPLY_VERSION ?= v13.2
HELM_CHART_PATH ?= charts/v13.2/helm
RM_SUBMODULE_NAME ?= v13.2

.PHONY: git-submodule-update
update-submodule:
	git submodule update --init --recursive

.PHONY: create-patch
create-patch:
	diff -ruN ./charts/v13.2/helm ./charts/v13.2_copy/helm > ./patch/kiwi_$(LATEST_KIWI_VERSION).patch || exit 0

.PHONY: patch-helm
patch-helm-chart:
	-git submodule update --init --recursive
	-patch --directory=$(HELM_CHART_PATH) -p4 < ./patch/kiwi_$(PATCH_APPLY_VERSION).patch
	-cp -r environments $(HELM_CHART_PATH)
	@echo '${HELM_CHART_PATH}'

.PHONY: patch-helm
patching:
	-patch --directory=$(HELM_CHART_PATH) -p4 < ./patch/kiwi_$(PATCH_APPLY_VERSION).patch

.PHONY: rm-submoduleACME
rm-submoduleACME:
	git submodule deinit -f $(RM_SUBMODULE_NAME)
	git rm -f $(RM_SUBMODULE_NAME)
	rm -rf .git/modules/$(RM_SUBMODULE_NAME)
	rm -rf ./submoduleACME
