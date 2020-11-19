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
         image-coloring)

(define (darken-color color amount)
  (change-color-brightness (- amount) color ))

;Green
(define green "#3FD972") 
(define green-base-color (hex->color green))
(define green-dark-1 (~a "#" (color->hex-string (darken-color green-base-color 15))))

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
       style: (properties padding: "0 0 0 0")
    (a class: "navbar-brand"
       href: "/index.html"
       style: (properties color: "white"
                          padding-top: "0"
                          padding-bottom: "0"
                          )
       (img src: "https://scontent-lax3-2.xx.fbcdn.net/v/t1.0-1/cp0/p50x50/93418588_10100674605427360_1483847794165809152_o.jpg?_nc_cat=107&ccb=2&_nc_sid=7206a8&_nc_ohc=EKvAn-_u89wAX8sOQC5&_nc_ht=scontent-lax3-2.xx&tp=27&oh=19300b472f54f056c908407d79707544&oe=5FCA9E85"
                 height: 40
                 alt: "Lindsey Handley")
       "    Lindsey D. Handley, Ph.D."
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
                              #:name [name "Project name"]
                              #:body [body "Project description"])
  (card style: (properties background-color: green)
        (card-header style: (properties background-color: green-dark-1) 
        (b name))
	(card-body body)))

(define (past-project-card #:class [class ""]
                              #:name [name "Project name"]
                              #:body [body "Project description"])
  (card class: "text-white"
        style: (properties background-color: purple)
        (card-header style: (properties background-color: purple-dark-1)
        (b name))
	(card-body body)))
