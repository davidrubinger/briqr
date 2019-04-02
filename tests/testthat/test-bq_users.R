context("Briq users")

test_that("Error when invalid inputs", {
    expect_error(bq_users(organization = "", api_token = "my_token"))
    expect_error(bq_users(organization = "my_org", api_token = ""))
})

with_mock_api({
    test_that("Tibble is generated", {
        users <- bq_users(
            organization = "your-organization", api_token = "briq_api_token"
        )
        expect_is(users, "tbl_df")
    })
})
