
#' @importFrom rlang abort
#' @importFrom glue glue

DDINode <- R6::R6Class(
  "DDINode",
  public = list(
    initialize = function(name, attr, children) {
      stopifnot(is.list(attr))
      stopifnot(is.list(children))

      private$attr <- attr
      private$chld <- children
    },

    add_children = function(x) {
      stopifnot(is.list(chld))

      private$chld <- c(private$chld, x)

      invisible(self)
    },

    add_attr = function(name, x) {
      if (name %in% names(private$attr)) {
        abort(glue("Duplicate attribute `{name}`"), name = name)
      }

      private$attr[[name]] <- x

      invisible(self)
    },
    remove_attr = function(name) {
      private$attr[[name]] <- NULL
    },

    to_xml = function() {
      # lapply(chld)
    }
  ),
  private = list(
    attr = list(),
    chld = list()
  )
)

ChildList <- R6::R6Class(
  "ChildList",
  public = list(
    add = function(key, x) {
      if (key %in% names(private$data)) {
        abort(glue("Duplicate key `{id}`"), key = key)
      }

      private$data[[key]] <- x

      invisible(self)
    },
    remove = function(key) {
      private$data[[key]] <- NULL
    }
  ),
  private = list(
    data = list()
  )
)

DataDscr <- R6::R6Class(
  "DataDscr",
  public = list(

  ),
  private = list(
    varGrp = list(),
    var = list()
  )
)

Var <- R6::R6Class(
  "Var",
  public = list(
  ),
  private = list(
    catgry = list(),
    labl = NULL,
    txt = NULL
  )
)

Catgry <- R6::R6Class(
  "Catgry",
  inherit = DDINode,
  public = list(

  ),
  private = list(
    # missing = ("Y" | "N") : "N",
    # missType = xs:string,
    # country = xs:string,
    # sdatrefs = xs:IDREFS,
    # excls = ("true" | "false") : "true",
    # catgry = xs:IDREFS,
    # level = xs:IDREF,
    catStat = NULL,
    catValu = NULL,
    labl = NULL,
    mrow = NULL,
    txt = NULL
  )
)

