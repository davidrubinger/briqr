#' Briq transactions
#'
#' List all the 'Briq' transactions of your organization
#'
#' @param max_results_per_page Maximum number of results per page
#' @param pause_between_pages Number of seconds to wait between page requests
#' @param organization Name of your Briq organization
#' @param api_token Briq API token
#'
#' @return Returns a tibble of Briq transactions of your organization
#' @export
#' @examples
#' \dontrun{
#' # Read organization and api_token from .Renviron file
#' bq_transactions()
#'
#' # Manually enter in organization and api_token
#' bq_transactions(organization = "My Org", api_token = "xYz123")
#' }
bq_transactions <- function (max_results_per_page = 100,
                             pause_between_pages = 0,
                             organization = Sys.getenv("organization_name"),
                             api_token = Sys.getenv("briq_api_token")) {

    if (!(is.finite(max_results_per_page) &&
          max_results_per_page >= 0 &&
          max_results_per_page < 100000 &&
          max_results_per_page %% 1 == 0)) {
        stop(paste(
            "max_results_per_page must be a nonnegative whole number",
            "less than 100000"
        ))
    }
    if (!(is.finite(pause_between_pages) && pause_between_pages >= 0)) {
        stop("pause_between_pages must be a nonnegative number")
    }
    if (organization == "")  stop("organization is an empty string")
    if (api_token == "")  stop("api_token is an empty string")

    pg <- NULL
    pgs <- NULL
    i <- 1
    while (nrow(pg) >= max_results_per_page || is.null(pg)) {

        resp <- httr::GET(
            url = paste0(
                "https://www.givebriq.com/v0/organizations/", organization,
                "/transactions?page=", i, "&per_page=", max_results_per_page
            ),
            config = httr::authenticate(user = api_token, password = "")
        )
        pg <- resp_to_tbl(resp)
        pgs <- dplyr::bind_rows(pgs, pg)
        i <- i + 1
        Sys.sleep(pause_between_pages)
    }
    return(pgs)
}
