#!/bin/bash
set -o errexit
set -o nounset

dpkg -i "${PKG_FILE}"
