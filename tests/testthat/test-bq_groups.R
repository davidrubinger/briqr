context("Briq groups")

test_that("Error when invalid inputs", {
    expect_error(bq_groups(max_results_per_page = NA_real_))
    expect_error(bq_groups(max_results_per_page = "x"))
    expect_error(bq_groups(max_results_per_page = -1))
    expect_error(bq_groups(max_results_per_page = 1.5))
})
