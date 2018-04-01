#lang scribble/manual
@(require (for-label json))

@title{jsonic: because JSON sucks}
@author{Danny O'Connor}

@defmodulelang{jsonic}

@section{Introduction}

This is a domain-specific language to embed s-expressions in JSON
that relies on the @racketmodname[json] library.

In particular, the @racket[jsexpr->string] function.

If we start with this:

@verbatim|{
#lang jsonic

[
  @$ 'null $@,
  @$ (* 6 7) $@,
  @$ (= 2 (+ 1 1)) $@
]

}|

We'll end up with this:

@verbatim{
[
  null,
  42,
  true
]
}









