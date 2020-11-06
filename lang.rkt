#lang at-exp racket

(provide project-card
	 card-row)

(require website-js)

(define (card-row . cards)
  (row
    (map (curry div class: "p-2 col-xs-12 col-md-6 col-lg-4")
	 cards)))

(define (project-card #:class [class ""]
                      [head "Project name"]
		      [body "Project description"])
  (card class: class 
        (card-header head)
	(card-body body)))
