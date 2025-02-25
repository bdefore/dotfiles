#!/bin/bash
# Sync primary selection and clipboard
wl-paste --primary --watch wl-copy &
wl-paste --watch wl-copy --primary &
