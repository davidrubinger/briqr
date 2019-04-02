context("Briq users")

test_that("Error when invalid inputs", {
    expect_error(bq_users(organization = "", api_token = "my_token"))
    expect_error(bq_users(organization = "my_org", api_token = ""))
})
