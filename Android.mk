#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := HexoLibreOms
LOCAL_PATH_$(LOCAL_MODULE) := $(LOCAL_PATH)

$(LOCAL_MODULE):
	echo "Ready to make resolved overlays!"
	export LOCAL_PATH_HexoLibreOms="$(abspath $(TOP))/$(LOCAL_PATH_HexoLibreOms)"; \
	bash $(LOCAL_PATH_HexoLibreOms)/makescripts/01makeResolvedOverlays.sh

all: $(LOCAL_MODULE)
.PHONY: $(LOCAL_MODULE)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := HexoLibre
LOCAL_JAVA_LIBRARIES := framework-base
LOCAL_ADDITIONAL_DEPENDENCIES := HexoLibreOms

$(LOCAL_PACKAGE_NAME): HexoLibreOms

include $(BUILD_PACKAGE)

include $(CLEAR_VARS)

LOCAL_MODULE := HexoLibreCleanup

$(LOCAL_MODULE): HexoLibre
	export LOCAL_PATH_HexoLibreOms="$(abspath $(TOP))/$(LOCAL_PATH_HexoLibreOms)"; \
	bash $(LOCAL_PATH_HexoLibreOms)/makescripts/99cleanup.sh

all: $(LOCAL_MODULE)
.PHONY: $(LOCAL_MODULE)

include $(CLEAR_VARS)

include $(CLEAR_VARS)

LOCAL_MODULE := HexoLibreFull

$(LOCAL_MODULE): HexoLibreCleanup

all: $(LOCAL_MODULE)
.PHONY: $(LOCAL_MODULE)

