FROM alpine:latest
MAINTAINER Chris Hays

ARG pwd=/home
WORKDIR $pwd
COPY ./src/ ./src/
RUN apk update && \
    apk add bash && \
    apk add python3 && \
    apk add unzip && \
    pip3 install --upgrade pip && \
    pip3 install -r ./src/python/requirements.txt 
ADD https://opportunityinsights.org/wp-content/uploads/2018/10/tract_outcomes.zip $pwd/data/orig/
ADD https://nces.ed.gov/programs/edge/data/GRF13.zip $pwd/data/orig/
RUN ./src/scripts/clean.sh
ENTRYPOINT ["/bin/bash"]
