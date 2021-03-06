#' Split df into one of only factors and one of only numerics.
#'
#' @param data A dataframe or matrix.
#' @param strings_to_factors Convert character strings to factors if True,
#'   otherwise ignore character string variables.
#'
#' @return Results list.
#'
#' Convert strings to factors as well.
#'
#' @export
separate_factors_numerics = function(data, strings_to_factors = T) {

  if (strings_to_factors) {
    # Identify character strings.
    is_char = sapply(data, is.character)

    # Convert strings to factors.
    data[, is_char] = sapply(data[, is_char], as.factor)
  }

  # Identify factors.
  is_factor = sapply(data, is.factor)
  df_factors = data[, is_factor, drop=F]

  # Identify numerics.
  is_numeric = sapply(data, is.numeric)
  df_numerics = data[, is_numeric, drop=F]

  result = list(df_factors = df_factors, df_numerics = df_numerics)
  return(result)
}
