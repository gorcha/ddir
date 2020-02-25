## code to prepare `DATASET` dataset goes here

download.file("http://www.ddialliance.org/Specification/DDI-Codebook/2.5/XMLSchema/codebook.xsd",
              "data-raw/codebook.xsd")

ddi_schema <- xml2::read_xml("data-raw/schemas/codebook.xsd")
ddi_schema_list <- xml2::as_list(ddi_schema)

usethis::use_data(ddi_schema, internal = TRUE, overwrite = TRUE)

download.file("http://www.ddialliance.org/system/files/NHS-99M001X-E-2011-pumf-individuals.xml",
              "data-raw/NHS-99M001X-E-2011-pumf-individuals.xml")

ddi_example <- xml2::read_xml("data-raw/NHS-99M001X-E-2011-pumf-individuals.xml")
ddi_list <- xml2::as_list(ddi_example)
