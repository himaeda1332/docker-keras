FROM himaeda1332/rstudio-ml-rstan:latest
LABEL maintainer="himaeda@umich.edu"

ENV DEBCONF_NOWARNINGS yes

RUN install2.r -s --error \
tidymodels \
tensorflow \
keras \
tfestimators

# Installing pip and virtualenv
# NOT installing pip via apt: 
## https://unix.stackexchange.com/questions/182308/install-python-pip-in-debian-wheezy
RUN wget https://bootstrap.pypa.io/get-pip.py  \
&& python get-pip.py \
&& python3 get-pip.py \
&& pip install virtualenv

# Installing latest keras with latest tensorflow (CPU version)
RUN r -e "library(keras) ; install_keras(method='virtualenv', version='default', tensorflow='default')"