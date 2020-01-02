# Equality of Opportunity: Cross-sectional Education Funding Disparity Experiments

## TODO
* More precise school district boundaries. Currently we are using school district boundaries from 2013. Ideally, we would like to use those from 2010 (bc that is when the Opportunity Atlas census tracts for outcomes were set.) More accuracy will mean that we won't get noise from school redistricting. Even better, we would like to find geographic relationship files for ~1980 school districts and 2010 census tracts. If can find ~1980 school districts to 1980 census tracts, we could map 1980 census tracts to 2010 census tracts. 

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
Once you have the image, you can build and run it with
```
docker build johnchrishays/eop && docker run -it johnchrishays/eop
```

## Scrubbing Data

From the circumstance and outcome data, we want the foloowing columns for each race by gender by parent income cell: `kfr`, `kfr_stycz`, `kfr_top01`, `kfr_top20`, `kfr_[age]`, `kir`, `kir_stycz`, `kir_top01`, `kir_top20`, `kir_[age]`.

Probably we will only really care about the following outcomes: `kir_[age]`.

## Exploring Data

## Modeling Data
