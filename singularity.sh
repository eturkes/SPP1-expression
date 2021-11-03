#!/bin/sh

# Copyright 2021 Emir Turkes, UK DRI at UCL
#
# Licensed under the Apache License, Version 2.0 (the "License");
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

# Shell script for building a Singularity image from Docker Hub and running it.

singularity pull spp1-expression.simg docker://eturkes/spp1-expression:R4.1.1v2

if [ "$1" = "all" ]; then
    singularity exec \
        -B .:/home/rstudio/SPP1-expression \
        spp1-expression.simg \
    Rscript -e "source('/home/rstudio/SPP1-expression/R/run_all.R')"
elif [ "$1" = "rstudio" ]; then
    # TODO: Point bind point to user's home
    DISABLE_AUTH=true RSTUDIO_SESSION_TIMEOUT="0" \
    singularity exec \
        -B .:/home/rstudio/SPP1-expression \
        spp1-expression.simg rserver --www-address=127.0.0.1 --www-port=$2
fi
