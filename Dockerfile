FROM alpine:latest
MAINTAINER Chris Hays

ARG pwd=/home
WORKDIR $pwd
RUN apk update && \
    apk add bash && \
    apk add python3 && \
    apk add unzip && \
    pip3 install --upgrade pip && \
    pip3 install csvkit
ADD https://opportunityinsights.org/wp-content/uploads/2018/10/tract_outcomes.zip $pwd/data/orig/
COPY ./src/ ./src/
RUN chmod 755 ./src/scripts/clean.sh && \
    ./src/scripts/clean.sh
ENTRYPOINT ["/bin/bash"]
