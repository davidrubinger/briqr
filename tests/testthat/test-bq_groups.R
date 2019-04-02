context("Briq groups")

test_that("Error when invalid inputs", {
    expect_error(bq_groups(organization = "", api_token = "my_token"))
    expect_error(bq_groups(organization = "my_org", api_token = ""))
})

with_mock_api({
    test_that("Tibble is generated", {
        groups <- bq_groups(
            organization = "your-organization", api_token = "briq_api_token"
        )
        expect_is(groups, "tbl_df")
    })
})
