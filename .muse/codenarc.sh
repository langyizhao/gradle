#!/usr/bin/env bash
commit=$2
cmd=$3

function version() {
    echo 1
}

function applicable() {
    echo "true"
}

function gettool() {
  apt
  pushd /tmp >/dev/null
  curl -LO https://github.com/smagill/codenarc-muse/blob/main/CodeNarc-2.0.0.tgz?raw=true
  tar xzf CodeNarc-2.0.0.tgz
  popd >/dev/null
}

function emit_results() { 
  echo "$1"
}

function run() {
  gettool
  raw_results=$(/tmp/codenarc ./)
  emit_results "$raw_results"
}

if [[ "$cmd" = "run" ]] ; then
  run
fi
if [[ "$cmd" = "applicable" ]] ; then
  applicable
fi
if [[ "$cmd" = "version" ]] ; then
  version
fi
