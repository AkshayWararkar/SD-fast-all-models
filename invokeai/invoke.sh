#!/bin/bash

set -eu

# ensure we're in the correct folder in case user's CWD is somewhere else
scriptdir=$(dirname "$0")
cd "$scriptdir"

export INVOKEAI_ROOT="$scriptdir"

# set required env var for torch on mac MPS
 if [ "$(uname -s)" == "Darwin" ]; then
     export PYTORCH_ENABLE_MPS_FALLBACK=1
 fi

if [ "$0" != "bash" ]; then
    .venv/bin/python .venv/bin/invoke.py --web
else # in developer console
    python --version
    echo "Press ^D to exit"
    export PS1="(InvokeAI) \u@\h \w> "
fi
