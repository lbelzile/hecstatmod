#' Covariance matrices for random effect models
#'
#' @export
#' @param model linear mixed model fitted via \code{lme4::lme}, or an object of class \code{lmerMod}
#' @param ... additional arguments, currently ignored
#' @return an invisible list with components \code{var_y}, \code{var_raneff}, \code{var_error}
#' @author Ben Bolker
#' @source https://stackoverflow.com/questions/45650548/get-residual-variance-covariance-matrix-in-lme4/45655597#45655597
rescov <- function(model, ...) {
  stopifnot(inherits(model, "lmerMod"))
  var.d <- Matrix::crossprod(lme4::getME(model, "Lambdat"))
  Zt <- lme4::getME(model,"Zt")
  vr <- sigma(model)^2
  var.b <- vr*(Matrix::t(Zt) %*% var.d %*% Zt)
  sI <- vr * Matrix::Diagonal(nrow(model@frame))
  var.y <- var.b + sI
  invisible(structure(list(var_y = var.y,
                           var_raneff = var.b,
                           var_error = sI),
                      class = "lme_rescov"))
}

#' Plot of the covariance or correlation matrix of Y
#'
#' @export
#' @inheritParams rescov
#' @param x object of class \code{hec_rescov}
#' @param corr logical; if \code{TRUE}, prints the correlation matrix instead of the covariance matrix
plot.lme_rescov <- function(x, corr = FALSE, ...){
  if(corr){
  image(cov2cor(x$var_y),
                     sub = "", xlab = "", ylab = "")
  } else{
    image(x$var_y,
          sub = "", xlab = "", ylab = "")
  }
}
