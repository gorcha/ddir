
ddi_catgry <- function(value, label, missing = NULL, stat = list()) {
  x <- xml_new_root("catgry")
  xml_add_child(x, "catValu", value)
  xml_add_child(x, "labl", label)

  if (!is.null(missing)) xml_attr(x, "missing") <- missing

  structure(x, class = c(class(x), "ddi_catgry"))
}

ddi_codeBook <- function() {
  x <- xml_new_root("codeBook",
                    `xml:lang` = "en",
                    xmlns = "ddi:codebook:2_5",
                    `xmlns:xsi` = "http://www.w3.org/2001/XMLSchema-instance",
                    `xsi:schemaLocation` = "ddi:codebook:2_5 http://www.ddialliance.org/Specification/DDI-Codebook/2.5/XMLSchema/codebook.xsd",
                    version = "2.5")
  xml_add_child(x, "docDscr")

  x
}

ddi_dataDscr <- function() {
  x <- xml_new_root("dataDscr")

  x
}

ddi_var <- function(name, label = NULL) {
  x <- xml_new_root("var", name = name)
  if (!is.null(label)) xml_add_child(x, "labl", label)

  structure(x, class = c(class(x), "ddi_var"))
}

ddi_varFormat <- function(formatname, schema, type = "numeric", otherSchema = NULL) {
  x <- xml_new_root("varFormat", type = type, schema = schema, formatname = formatname)

  if (!is.null(otherSchema)) xml_attr(x, "otherSchema") <- otherSchema

  x
}
