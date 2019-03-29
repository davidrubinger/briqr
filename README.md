
briqr
=====

`briqr` provides access to the [Briq API](https://briq.github.io) using R

Installation
------------

``` r
devtools::install_github("davidrubinger/briqr")
```

Authentication
--------------

Get a Briq API token by creating a new custom application in the [Briq admin section](https://www.givebriq.com/app/admin/apps#custom).

`briqr` functions will read the API token from environment variable `briq_api_token`, which should be included in a `.Renviron` file in your home directory like so:

`briq_api_token = your_briq_api_token`

`briqr` functions will read your organization name from environment variable `organization_name`, included in `.Renviron` like so:

`organization_name = your_organization_name`

Usage
-----

You can get data frames of all the users (`bq_users()`), user groups (`bq_user_groups()`) and transactions (`bq_transactions()`) of your organization.

Example
-------

Return a tibble of all Briq users within your organization:

``` r
library(briqr)
bq_users()
```
