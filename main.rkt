#lang at-exp racket

(require (only-in website md)
         website-js
	 "./lang.rkt")

(define (site)
  (list
    (bootstrap-files)
    (page index.html
	  (content
	    (container class: "p-5"
		       @md{
		       # Lindsey D. Handley, Ph.D.

		       -------
		       }

		       @md{
		       ## Projects

		       @(card-row
			  (project-card
			    "CodeSpells")

			  (project-card
			    "ThoughtSTEM")
			  
                          (project-card
			    "Don't Teach Coding: Until You Read This Book")

			  (project-card
			    "Blog")

                          )
		       }

		       @md{
                       ## Past Projects

		       @(card-row
			  (project-card
			    "MetaCoders"
			    @md{
			     Sub-projects:

			     * a
			     * b
			     * c
			    })

			  (project-card
			    "2D Games"
			    @md{
			     Sub-projects:

			     * a
			     * b
			     * c
			    })

			  (project-card
			    "Website Tech"
			    @md{
			     Sub-projects:

			     * a
			     * b
			     * c
			    })

			  (project-card
			    "Ph.D. Research"))


		       }
		       )))))

(module+ main
	 (render #:to "out"
		 (site)))

