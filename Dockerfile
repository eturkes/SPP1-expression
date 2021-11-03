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

FROM eturkes/r-docker-minimal:R4.1.1v1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        zlib1g-dev \
        libxml2-dev \
        libbz2-dev \
        liblzma-dev \
        libglpk-dev \
    && Rscript -e "install.packages('rmarkdown')" \
        -e "install.packages('mime')" \
        -e "install.packages('Seurat')" \
        -e "install.packages('BiocManager')" \
        -e "BiocManager::install('scRNAseq')" \
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/ \
        /tmp/downloaded_packages/ \
        /tmp/*.rds

LABEL maintainer="Emir Turkes emir.turkes@eturkes.com"
