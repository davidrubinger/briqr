#' Briq user groups
#'
#' List all the 'Briq' user groups of your organization
#'
#' @param organization Name of your Briq organization
#' @param api_token Briq API token
#'
#' @return Returns a tibble of Briq user groups of your organization
#' @export
#' @examples
#' \dontrun{
#' # Read organization and api_token from .Renviron file
#' bq_groups()
#'
#' # Manually enter in organization and api_token
#' bq_groups(organization = "My Org", api_token = "xYz123")
#' }
bq_groups <- function (organization = Sys.getenv("organization_name"),
                       api_token = Sys.getenv("briq_api_token")) {

    if (organization == "")  stop("organization is an empty string")
    if (api_token == "")  stop("api_token is an empty string")

    resp <- httr::GET(
        url = paste0(
            "https://www.givebriq.com/v0/organizations/", organization,
            "/groups"
        ),
        config = httr::authenticate(user = api_token, password = "")
    )
    resp_to_tbl(resp)
}
