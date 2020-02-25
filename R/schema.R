

haven_to_ddi <- function(x) {

}

ddi_to_haven <- function(x, meta) {

}

as_ddi <- function(x, ...) {
  UseMethod("as_ddi")
}

as_ddi.data.frame <- function(x, ...) {
  dat <- ddi_dataDscr()

  iwalk(x, ~ xml_add_child(dat, as_ddi(.x, .y)))

  dat
}

as_ddi.haven_labelled <- function(x, name, ...) {
  var_attr <- attributes(x)

  var <- ddi_var(name, var_attr$label)

  for (i in grep("^format\\.", names(var_attr), value = TRUE)) {
    xml_add_child(var,
                  ddi_varFormat(var_attr[[i]],
                                switch(i,
                                       format.spss = "SPSS",
                                       format.sas = "SAS",
                                       format.stata = "other"),
                                ifelse(is.character(x), "character", "numeric"),
                                if (i == "format.stata") "STATA" else NULL))
  }

  if ("labels" %in% names(var_attr)) {
    imap(var_attr$labels, ~ xml_add_child(var, ddi_catgry(.x, .y)))
  }

  var
}

as_ddi.default <- function(x, name, ...) {
  if (!is.atomic(x))
    abort("Object cannot be converted to ddi.")

  var_attr <- attributes(x)
  var <- ddi_var(name, var_attr$label)

  for (i in grep("^format\\.", names(var_attr), value = TRUE)) {
    xml_add_child(var,
                  ddi_varFormat(var_attr[[i]],
                                switch(i,
                                       format.spss = "SPSS",
                                       format.sas = "SAS",
                                       format.stata = "other"),
                                ifelse(is.character(x), "character", "numeric"),
                                if (i == "format.stata") "STATA" else NULL))
  }

  var
}
