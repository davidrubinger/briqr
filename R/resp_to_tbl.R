#' @importFrom magrittr %>%
resp_to_tbl <- function (resp) {

    if (httr::http_error(resp)) {
        stop(paste0("Briq API request failed [", resp$status_code, "]"))
    }
    if (httr::http_type(resp) != "application/json") {
        stop("API did not return json")
    }

    resp_tbl <-
        resp %>%
        httr::content("text") %>%
        jsonlite::fromJSON(flatten = TRUE) %>%
        tibble::as_tibble()

    resp_tbl
}
