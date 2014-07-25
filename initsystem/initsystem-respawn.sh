#!/usr/bin/ash

# This file is part of initsystem
#
# Copyright (C) 2014 Valère Monseur (valere dot monseur at ymail dot com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

set -u

PATH="/opt/busybox"
export PATH

cd /
umask 022

################################################################################
# sanity check #################################################################
################################################################################

if [ $PPID != 1 ]; then
  echo "error: this script should have ppid 1"
  exit 1
fi

################################################################################
# respawn command ##############################################################
################################################################################

exec getty -l "${PATH}"/login 38400 tty1 linux
