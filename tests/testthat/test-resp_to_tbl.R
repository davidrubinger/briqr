context("Converting API response to tibble")

test_that("Tibble is produced", {
    expect_is(resp_to_tbl(httr::GET("http://httpbin.org/json")), "tbl_df")
})
