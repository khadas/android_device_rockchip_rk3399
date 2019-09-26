#
# Copyright 2014 The Android Open-Source Project
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

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/rk3399.mk \
    $(LOCAL_DIR)/rk3399_mid.mk \
    $(LOCAL_DIR)/rk3399pro.mk  \
    $(LOCAL_DIR)/rk3399_mid_qt/rk3399_mid_qt.mk \
    $(LOCAL_DIR)/rk3399pro_qt.mk

COMMON_LUNCH_CHOICES := \
	rk3399_mid-userdebug \
	rk3399_mid-user \
	rk3399_mid_qt-userdebug \
        rk3399_mid_qt-user \
	rk3399pro-userdebug \
        rk3399pro-user \
	rk3399pro_qt-userdebug \
        rk3399pro_qt-user
