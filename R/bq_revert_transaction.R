#' Revert Briq transaction
#'
#' Revert a 'Briq' transaction
#'
#' @param transaction_id ID of transaction to revert
#' @param organization Name of your Briq organization
#' @param api_token Briq API token
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Read organization and api_token from .Renviron file
#' bq_revert_transaction(transaction_id = "a1b-2c3")
#'
#' # Manually enter in organization and api_token
#' bq_revert_transaction(
#'     transaction_id = "a1b-2c3", organization = "My Org", api_token = "xYz123"
#' )
#' }
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
