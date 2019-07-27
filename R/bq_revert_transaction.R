bq_revert_transaction <- function (transaction_id,
                                   organization = Sys.getenv("organization_name"),
                                   api_token = Sys.getenv("briq_api_token")) {

    if (organization == "")  stop("organization is an empty string")
    if (api_token == "")  stop("api_token is an empty string")

    resp <- httr::DELETE(
        url = paste0(
            "https://www.givebriq.com/v0/organizations/", organization,
            "/transactions/", transaction_id
        ),
        config = httr::authenticate(user = api_token, password = "")
    )
    if (resp$status_code != 204)  print("Revert not successful")
}
