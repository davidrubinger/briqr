#' Briq users
#'
#' List all the 'Briq' users of your organization
#'
#' @param organization Name of your Briq organization
#' @param api_token Briq API token
#'
#' @return Returns a tibble of Briq users of your organization
#' @export
bq_users <- function (organization = Sys.getenv("organization_name"),
                      api_token = Sys.getenv("briq_api_token")) {

    if (organization == "")  stop("organization is an empty string")
    if (api_token == "")  stop("api_token is an empty string")

    resp <- httr::GET(
        url = paste0(
            "https://www.givebriq.com/v0/organizations/", organization, "/users"
        ),
        config = httr::authenticate(
            user = Sys.getenv("briq_api_token"), password = ""
        )
    )
    resp_to_tbl(resp)
}
