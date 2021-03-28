#lang at-exp racket

(provide sticky-navbar
         current-project-card
         past-project-card
         green
         green-dark-1
         orange
         orange-dark-1
         purple
         purple-dark-1)

(require website-js
         (only-in 2htdp/image color-alpha)
         image-coloring
         "./imgs.rkt")

(define (darken-color color amount)
  (change-color-brightness (- amount) color ))

;Green
(define green "#3FD972") 
(define green-base-color (hex->color green))
(define green-dark-1 (~a "#" (color->hex-string (darken-color green-base-color 15))))
;(define green-dark-2 (~a "#" (color->hex-string (darken-color green-dark-1 15))))

;Orange
(define orange "#f9a21d") 
(define orange-base-color (hex->color orange))
(define orange-dark-1 (~a "#" (color->hex-string (darken-color orange-base-color 15))))

;Purple
(define purple "#50148C") 
(define purple-base-color (hex->color purple))
(define purple-dark-1 (~a "#" (color->hex-string (darken-color purple-base-color 15))))

(define (sticky-navbar)

  (list
  (nav class: "navbar fixed-top navbar-dark bg-dark navbar-expand-md"
       style: (properties padding: "0 10px 0 10px")
    (a class: "navbar-brand"
       href: "/index.html"
       style: (properties color: "white"
                          padding-top: "0"
                          padding-bottom: "0"
                          )
       (img src: (prefix/pathify profile-pic-img-path) 
                 height: 80
                 alt: "Lindsey Handley's profile picture")
       (div class: "pl-4 pb-0 align-middle"
            style: (properties display: "inline-block")
        (h1 "Lindsey D. Handley, Ph.D."))
       )
    (button id: "navbarToggler" 'onclick: "toggleNavbarSolid();" class: "navbar-toggler" type: "button" `data-toggle: "collapse" `data-target: "#navbarSupportedContent" `aria-controls: "navbarSupportedContent" `aria-expanded: "false" `aria-label: "Toggle navigation"
        (span class: "navbar-toggler-icon")
        @script/inline{
 function toggleNavbarSolid() {
  var navContent = document.getElementById('navbarSupportedContent');
  if($(this).scrollTop() <= (.05 * window.innerHeight) &&
     navContent.classList.contains("show")) {
     $('.navbar').removeClass('solid');
   } else {
     $('.navbar').addClass('solid');
  }
  }})
    (div class: "collapse navbar-collapse" id: "navbarSupportedContent"
      (ul class: "navbar-nav ml-auto"
          (my-nav-link "https://codespells.org" "CodeSpells")
          (my-nav-link "https://www.learntomod.com" "LearnToMod")
          (my-nav-link "https://www.thoughtstem.com" "ThoughtSTEM")
          (my-nav-link "https://www.dont-teach.com/coding" "CSEd Publications")
          (my-social-media-link "facebook" "https://www.facebook.com/handley.lindsey/") 
          (my-social-media-link "twitter" "https://twitter.com/LindseyDHandley") 
          (my-social-media-link "instagram" "https://www.instagram.com/lindseyhandley/") 
          (my-social-media-link "linkedin" "https://www.linkedin.com/in/lindseydhandley/") 
          (my-social-media-link "github" "https://github.com/ldhandley") 
          )))))

(define (my-nav-link to text)
  (nav-item
    (a class: "nav-link mr-3 text-white"
       href: (pathify (add-path-prefix to))
       text)))

(define (my-social-media-link type to)
  (cond [(string=? type "facebook")
         (a href: to 
            class: "fab fa-facebook-square fa-2x p-1"
            style: (properties color: orange)
            )]
        [(string=? type "twitter")
         (a href: to 
            class: "fab fa-twitter-square fa-2x p-1"
            style: (properties color: orange)
         )]
        [(string=? type "linkedin")
         (a href: to 
            class: "fab fa-linkedin fa-2x p-1"
            style: (properties color: orange)
         )]
        [(string=? type "instagram")
         (a href: to 
            class: "fab fa-instagram-square fa-2x p-1"
            style: (properties color: orange)
         )]
        [(string=? type "github")
         (a href: to 
            class: "fab fa-github fa-2x p-1"
            style: (properties color: orange)
         )]
    )
  )

(define (card-row . cards)
  (row
    (map (curry div class: "p-2 col-xs-12 col-md-6 col-lg-4")
	 cards)))

(define (current-project-card #:class [class ""]
                              #:link [link "https://www.google.com"]
                              #:name [name "Project name"]
                              #:body [body "Project description"])
  (card style: (properties background-color: green)
        (card-header style: (properties background-color: green-dark-1) 
        (b name))
	  (card-body body)
    (card-footer class: "p-0 m-0" 
      (a style: (properties text-decoration: "none") href: link
        (button-primary style: (properties background-color: green-dark-1 border: "0") class: "btn-block rounded-0" "Learn More...")))))

(define (past-project-card #:class [class ""]
                              #:link [link "https://www.google.com"]
                              #:name [name "Project name"]
                              #:body [body "Project description"])
  (card class: "text-white"
        style: (properties background-color: purple)
        (card-header style: (properties background-color: purple-dark-1)
        (b name))
	(card-body body)
    (card-footer class: "p-0 m-0" 
      (a style: (properties text-decoration: "none") href: link
        (button-primary style: (properties background-color: purple-dark-1 border: "0") class: "btn-block rounded-0" "Learn More...")))))
