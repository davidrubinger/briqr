context("Briq groups")

test_that("Error when invalid inputs", {
    expect_error(bq_groups(organization = "", api_token = "my_token"))
    expect_error(bq_groups(organization = "my_org", api_token = ""))
})
