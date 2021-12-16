#!/usr/bin/env bash

# Minikube status line for tmux
# Displays current status of minikube

# Copyright 2019 Arush Salil
#
#  Licensed under the MIT License.
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://opensource.org/licenses/MIT
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Default values for the plugin
MINIKUBE_TMUX_BINARY="${MINIKUBE_TMUX_BINARY:-minikube}"
MINIKUBE_TMUX_NAME_COLOR="${MINIKUBE_TMUX_NAME_COLOR:-white}"
MINIKUBE_TMUX_STATUS_COLOR="${MINIKUBE_TMUX_STATUS_COLOR:-green}"
MINIKUBE_TMUX_KEY="Minikube:"

MINIKUBE_TMUX_STATUS="$($MINIKUBE_TMUX_BINARY status | grep "Running" 2>/dev/null)"
if [[ ! -z ${MINIKUBE_TMUX_STATUS} ]] ; then
    MINIKUBE_TMUX_STATUS="Running"
    MINIKUBE_TMUX="#[fg=${MINIKUBE_TMUX_NAME_COLOR}] ${MINIKUBE_TMUX_KEY}#[fg=${MINIKUBE_TMUX_STATUS_COLOR}]${MINIKUBE_TMUX_STATUS}"
    echo $MINIKUBE_TMUX
else
    unset $MINIKUBE_TMUX
    MINIKUBE_TMUX_KEY=""
    MINIKUBE_TMUX_STATUS=""
    MINIKUBE_TMUX="#[fg=${MINIKUBE_TMUX_NAME_COLOR}] ${MINIKUBE_TMUX_KEY}#[fg=red]${MINIKUBE_TMUX_STATUS}"
    echo $MINIKUBE_TMUX
fi
