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

RUN Rscript -e "install.packages('rmarkdown')" \
        -e "install.packages('mime')" \
    && rm -Rf /tmp/downloaded_packages/ \
        /tmp/*.rds

LABEL maintainer="Emir Turkes emir.turkes@eturkes.com"
