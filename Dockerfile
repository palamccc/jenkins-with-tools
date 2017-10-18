FROM jenkins/jenkins:slim
USER root
RUN apt-get update \
    && apt-get install -y wget python mysql-client \
    && wget -qO- https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-175.0.0-linux-x86_64.tar.gz | tar -xz \
    && /google-cloud-sdk/install.sh --quiet
RUN ln -s /google-cloud-sdk/bin/gcloud /bin/ \
    && ln -s /google-cloud-sdk/bin/gsutil /bin/ \
    && ln -s /google-cloud-sdk/bin/bq /bin/
USER jenkins
RUN gcloud config set core/disable_usage_reporting true \
    && gcloud config set component_manager/disable_update_check true
