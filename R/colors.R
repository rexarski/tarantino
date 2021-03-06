#' Complete list of palettes
#'
#' Use \code{\link{tarantino_palette}} to construct palettes of desired length.
#'
#' @export
tarantino_palettes <- list(
  ReservoirDogs = c("#602311", "#46253B", "#504D6C", "#896161", "#7183AB", "#DDB7C6", "#0E0000"),
  PulpFiction = c("#19172C", "#E3C0A2", "#A54F50", "#A12A32", "#2F3279", "#3FB5C9", "#F9D067"),
  KillBillVol1 = c("#913077", "#245C59", "#477CCC", "#8B8EB1", "#68690B", "#D7DA4C", "#1F3D7B"),
  KillBillVol2 = c("#5C5739", "#FAF0CF", "#707B5D", "#DCDDD5", "#312208"),
  JackieBrown = c("#646A7A", "#AFC3DC", "#4F5A5B", "#AB795F", "#A99438", "#B6523B", "#33201F"),
  DeathProof = c("#2A0B0C", "#7E3C2E", "#A25137", "#B76F41", "#977367", "#395459", "#B27D77", "#E0B887"),
  InglouriousBasterds = c("#59590F", "#0D0D0D", "#8A7A23", "#374142", "#A5A95F", "#696E68"),
  DjangoUnchained = c("#8B8A85", "#A49D8B", "#904C04", "#7791A8", "#1C0801"),
  TheHatefulEight = c("#050010", "#191416", "#342c27", "#342c27", "#32170a", "#48221b", "#765437", "#9c9582", "#8c6602", "#650100"),
  OnceUponATimeInHollywood = c("#0f253a", "#253d43", "#341176", "#015c89", "#64828a", "#cd5873", "#d4008f", "#a60400", "#612620", "#976202")
)

#' A Quentin Tarantino palette generator
#'
#' Generate discrete or continuous color palettes from Quentin Tarantino's movies.
#'
#' @param name Name of desired palette. Choices are:
#' \code{ReservoirDogs}, \code{PulpFiction},
#' \code{KillBillVol1}, \code{KillBillVol2},
#' \code{JackieBrown}, \code{DeathProof},
#' \code{InglouriousBasterds}, \code{DjangoUnchained}
#' @param n Number of colors needed. All colors are extracted and picked from the posts on \href{https://moviesincolor.com}{Movies in Color}.
#' If \code{n} is omitted, all colours in that palette will be generated.
#' @param type Either "continuous" or "discrete".
#' @importFrom graphics rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' tarantino_palette("KillBillVol1")
#' tarantino_palette("KillBillVol1", 4)
#' tarantino_palette("KillBillVol1", 4, "continuous")
tarantino_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  pal <- tarantino_palettes[[name]]
  if (is.null(pal)) {
    stop("Palette not found.")
  }

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what the palette can offer")
  }

  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = pal[1:n]
  )

  structure(out, class = "palette", name = name)
}

#' Print a single palette
#' @param x A color palette generated by \code{tarantino_palette()} function.
#' @param ... Single or a vector of palette objects.
#' @importFrom graphics rect par image text
#' @export
print_palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n),
    col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n"
  )

  rect(0, 0.9, n + 1, 1.1, col = "#FFFFFFCC", border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
