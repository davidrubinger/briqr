context("Converting API response to tibble")

# Response object fixture
source("www.givebriq.com/v0/organizations/your-organization/users.R")

test_that("Tibble is generated", {
    expect_is(resp_to_tbl(resp), "tbl_df")
})
