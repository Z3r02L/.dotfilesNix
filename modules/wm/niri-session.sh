#!/bin/sh
# Скрипт для запуска Niri с параметрами для NVIDIA

# Устанавливаем переменные окружения для NVIDIA
export WLR_NO_HARDWARE_CURSORS=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export GBM_BACKEND=nvidia-drm
export LIBVA_DRIVER_NAME=nvidia
export EGL_PLATFORM=wayland
export WLR_RENDERER=vulkan

# Запускаем Niri с сессионными параметрами
exec niri --session
