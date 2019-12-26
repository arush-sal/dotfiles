#!/usr/bin/env bash

# Minikube status line for tmux
# Displays current status of minikube

# Copyright 2018 Arush Salil
#
#  Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
