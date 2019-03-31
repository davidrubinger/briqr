#' Briq transactions
#'
#' List all the Briq transactions of your organization
#'
#' @param max_results_per_page Maximum number of results per page
#' @param organization Name of your Briq organization
#' @param api_token Briq API token
#'
#' @return Returns a tibble of Briq transactions of your organization
#' @export
bq_transactions <- function (max_results_per_page = 100,
                             organization = Sys.getenv("organization_name"),
                             api_token = Sys.getenv("briq_api_token")) {

    if (!(is.finite(max_results_per_page) &&
          max_results_per_page >= 0 &&
          max_results_per_page %% 1 == 0)) {
        stop("max_results_per_page must be a nonnegative whole number")
    }
    if (organization == "")  stop("organization is an empty string")
    if (api_token == "")  stop("api_token is an empty string")

    resp <- httr::GET(
        url = paste0(
            "https://www.givebriq.com/v0/organizations/", organization,
            "/transactions?per_page=", max_results_per_page
        ),
        config = httr::authenticate(
            user = Sys.getenv("briq_api_token"), password = ""
        )
    )
    resp_to_tbl(resp)
}
