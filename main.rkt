  #lang at-exp racket

  (require (only-in website md)
           website-js
           "./html-helpers.rkt"
         )

(define (site)
  (list
    (bootstrap-files)
    (page index.html
	  (content
            (sticky-navbar)
	    (container class: "p-5"
		       @md{
		       # Lindsey D. Handley, Ph.D.

		       -------
		       }

		       @md{
		       ## Current Projects

		       @(card-deck  
			  (current-project-card
                            #:class "bg-warning text-white"
			    "CodeSpells")

			  (current-project-card
                            #:class "bg-success text-white"
			    "ThoughtSTEM")
			  
                          (current-project-card
                            #:class "bg-info text-white"
			    "CSEd Publications")

			  (current-project-card
			    "Blog")

                          )
		       }

		       @md{
                       ## Past Projects

		       @(card-deck
			  (current-project-card
			    "MetaCoders K-12 CSEd"
			    @md{
			     Sub-projects:

			     * a
			     * b
			     * c
			    })

			  (current-project-card
			    "LearnToMod"
			    @md{
			     Sub-projects:

			     * a
			     * b
			     * c
			    })

			  (current-project-card
			    "Ph.D. Research"))


		       }
		       )))))

(module+ main
	 (render #:to "out"
		 (site)))

