context("Briq transactions")

test_that("Error when invalid inputs", {
    expect_error(bq_transactions(max_results_per_page = NA_real_))
    expect_error(bq_transactions(max_results_per_page = "x"))
    expect_error(bq_transactions(max_results_per_page = -1))
    expect_error(bq_transactions(max_results_per_page = 1.5))
    expect_error(bq_transactions(max_results_per_page = 1e9))
    expect_error(bq_transactions(pause_between_pages = NA_real_))
    expect_error(bq_transactions(pause_between_pages = "x"))
    expect_error(bq_transactions(pause_between_pages = -1))
    expect_error(
        bq_transactions(
            max_results_per_page = 10, organization = "", api_token = "my_token"
        )
    )
    expect_error(
        bq_transactions(
            max_results_per_page = 10, organization = "my_org", api_token = ""
        )
    )
})

with_mock_api({
    test_that("Tibble is generated", {
        transactions <- bq_transactions(
            max_results_per_page = 10,
            organization = "your-organization",
            api_token = "briq_api_token"
        )
        expect_is(transactions, "tbl_df")
    })
})
