# Equality of Opportunity: Cross-sectional Education Funding Disparity Experiments

This document describes how to reproduce the cleaning and analysis found here.

## Setup

## Obtaining Data

[Circumstance and outcome data](https://opportunityinsights.org/paper/the-opportunity-atlas/)

[School district funding by year](https://www.census.gov/programs-surveys/gov-finances/data/historical-data.html)

District level covariates:

* [All outcomes by Census Tract, Race, Gender and Parental Income Percentile](https://opportunityinsights.org/data/)
* [Neighborhood Characteristics by Census Tract](https://opportunityinsights.org/data/) 

## Setting up the environment

### Docker Container

We use Docker containerization to aid in the reproducibility of the analysis. To download docker and read more, visit [https://docs.docker.com/v17.09/engine/installation/](https://docs.docker.com/v17.09/engine/installation/).

Once docker is installed, run the following command to pull my docker image. 
```
docker pull johnchrishays/eop
```


## Scrubbing Data

From the circumstance and outcome data, we want the foloowing columns for each race by gender by parent income cell: `kfr`, `kfr_stycz`, `kfr_top01`, `kfr_top20`, `kfr_[age]`, `kir`, `kir_stycz`, `kir_top01`, `kir_top20`, `kir_[age]`.

Probably we will only really care about the following outcomes: `kir_[age]`.

## Exploring Data

## Modeling Data

## Interre
