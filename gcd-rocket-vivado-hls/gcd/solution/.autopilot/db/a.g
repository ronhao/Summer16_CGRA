#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /work/zhang/common/tools/rocket/rocket-chip/gcd-rocket-vivado-hls/gcd/solution/.autopilot/db/a.g.bc ${1+"$@"}
