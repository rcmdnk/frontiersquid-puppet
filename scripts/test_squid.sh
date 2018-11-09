#!/bin/bash

#SQUID_SERVER="conddb-px01"
#SQUID_SERVER="conddb-px02"
SQUID_SERVER="cvmfs-px01"
#SQUID_SERVER="cvmfs-px02"

export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh --quiet
source ${ATLAS_LOCAL_ROOT_BASE}/packageSetups/atlasLocalDiagnostics.sh --quiet
#export FRONTIER_SERVER="(serverurl=http://frontier.triumf.ca:3128/ATLAS_frontier)(serverurl=http://atlasfrontier-ai.cern.ch:8000/atlr)(serverurl=http://ccfrontier.in2p3.fr:23128/ccin2p3-AtlasFrontier)(serverurl=http://lcgft-atlas.gridpp.rl.ac.uk:3128/frontierATLAS)(proxyurl=http://${SQUID_SERVER}:3128)"
export FRONTIER_SERVER="(serverurl=http://ccfrontier.in2p3.fr:23128/ccin2p3-AtlasFrontier)(serverurl=http://lcgft-atlas.gridpp.rl.ac.uk:3128/frontierATLAS)(serverurl=http://lcgvo-frontier01.gridpp.rl.ac.uk:3128/frontierATLAS)(serverurl=http://lcgvo-frontier02.gridpp.rl.ac.uk:3128/frontierATLAS)(proxyurl=http://${SQUID_SERVER}:3128)"
${ATLAS_LOCAL_ROOT_BASE}/utilities/fngetTest.sh
