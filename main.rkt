#lang at-exp racket

(require website/bootstrap 
        (only-in website md)
         "./html-helpers.rkt"
        "./imgs.rkt"         
)

(define (site)
  (list
    (bootstrap-files)
    (imgs)
    (page index.html
          (content
            (sticky-navbar)
            (container class: "p-5" style: (properties margin-top:"50px")
                       @md{
                       # Current Projects

                       @(card-deck  
                          (current-project-card
                            #:name "CodeSpells"
                            #:link "https://codespells.org/"
                            #:body "We're currently building a 3D video game and video game development platform where you play the role of a wizard that crafts magical spells with code. Learn more here...")

                          (current-project-card
                            #:name "ThoughtSTEM"
                            #:link "https://www.thoughtstem.com/"
                            #:body "Between 2012 and 2020, we taught thousands of students across San Diego coding through after-school programs, camps, and workshops. Learn more here...")

                          (current-project-card
                            #:name "CSEd Publications"
                            #:link "https://www.dont-teach.com/coding"
                            #:body @md{We wrote @i{Don't Teach Coding: Until You Read Book} for educators, parents, and anyone who is pursuing coding as a life skill. Learn more here...})

                          )
                       }
                       (div class: "p-2")
                       @md{
                       # Past Projects

                       @(card-deck
                          (past-project-card
                            #:link "https://metacoders.org/index.html"
                            #:name "MetaCoders K-12 CSEd"
                            #:body @md{
                            In 2020, we launched a non-profit with a mission to teach K-12 students not only programming, but also how to learn programming languages. MetaCoders took over all of ThoughtSTEM's in-person educational programs, freeing ThoughtSTEM to build coding educational software.
                            })

                          (past-project-card
                            #:link "https://www.learntomod.com/"
                            #:name "LearnToMod"
                            #:body @md{
                            ThoughtSTEM built LearnToMod, an platform that teaches kids coding by teaching them how to mod their favorite video game -- Minecraft. The software has been used to teach over 200,000 students how to code. 
                            })

                          (past-project-card
                            #:link "https://scholar.google.com/citations?user=Qnscb5kAAAAJ&hl=en"
                            #:name "Ph.D. Research"
                            #:body @md{
                            From 2010-2015, I studied the protein interactions between thrombin and thrombomodulin at UC San Diego in the lab of Elizabeth Komives. I'm a biochemist turned coder. 
                            }
                            ))
                       }
                       )))))

(module+ main
	 (render #:to "out"
		 (site)))

