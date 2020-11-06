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
		       ## Current Projects

		       @(card-deck  
			  (project-card
                            #:class "bg-warning text-white"
			    "CodeSpells")

			  (project-card
                            #:class "bg-success text-white"
			    "ThoughtSTEM")
			  
                          (project-card
                            #:class "bg-info text-white"
			    "CSEd Publications")

			  (project-card
			    "Blog")

                          )
		       }

		       @md{
                       ## Past Projects

		       @(card-deck
			  (project-card
			    "MetaCoders K-12 CSEd"
			    @md{
			     Sub-projects:

			     * a
			     * b
			     * c
			    })

			  (project-card
			    "LearnToMod"
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

