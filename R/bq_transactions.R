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
#' @importFrom magrittr %>%
bq_transactions <- function (max_results_per_page = 100,
                             organization = Sys.getenv("organization_name"),
                             api_token = Sys.getenv("briq_api_token")) {

    if (!(is.finite(max_results_per_page) &&
          max_results_per_page >= 0 &&
          max_results_per_page %% 1 == 0)) {
        stop("max_results_per_page must be a nonnegative whole number")
    }

    resp <- httr::GET(
        url = paste0(
            "https://www.givebriq.com/v0/organizations/", organization,
            "/transactions?per_page=", max_results_per_page
        ),
        config = httr::authenticate(
            user = Sys.getenv("briq_api_token"), password = ""
        )
    )
    if (httr::http_error(resp)) {
        stop(paste0("Briq API request failed [", resp$status_code, "]"))
    }
    if (httr::http_type(resp) != "application/json") {
        stop("API did not return json")
    }

    transactions <-
        resp %>%
        httr::content("text") %>%
        jsonlite::fromJSON(flatten = TRUE) %>%
        tibble::as_tibble()

    transactions
}
