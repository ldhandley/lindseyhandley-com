#lang racket

(provide imgs
         jpg-path->webp-path
         png-path->webp-path
         mp4-path->webm-path
         )

(require website/bootstrap
         (only-in 2htdp/image bitmap/file)
         racket/runtime-path)

(define-runtime-path img "img")
(define-runtime-path videos "videos")
(define-runtime-path files "files")

(define imgs-list
  '())

(define videos-list
  '())

(define files-list
  '())

(define-syntax-rule (define/provide/image img-path webp-path path)
  (begin
    (provide img-path webp-path)
    (define img-path path)
    (define webp-path (append (take img-path (sub1 (length img-path)))
                              (list (string-replace (last img-path)
                                                    (cond [(string-suffix? (last img-path) "png") "png"]
                                                          [(string-suffix? (last img-path) "gif") "gif"]
                                                          [(string-suffix? (last img-path) "jpg") "jpg"]
                                                          [else ""])
                                                    "webp"))))
    (set! imgs-list
          (append imgs-list
                  (list (page img-path
                              (apply build-path
                                     (append (list img)
                                             (drop img-path 1))))
                        (page webp-path
                              (apply build-path
                                     (append (list img)
                                             (drop webp-path 1))))
                        )))                                           
    ))

(define-syntax-rule (define/provide/img img-path path)
  (begin
    (provide img-path)
    (define img-path path)
    (set! imgs-list
          (append imgs-list
                  (list (page img-path
                              (apply build-path
                                     (append (list img)
                                             (drop img-path 1))))
                        )))                                           
    ))

(define-syntax-rule (define/provide/svg svg-path path)
  (begin
    (provide svg-path)
    (define svg-path path)
    (set! imgs-list
          (append imgs-list
                  (list (page svg-path
                              (apply build-path
                                     (append (list img)
                                             (drop svg-path 1))))
                        )))                                           
    ))

(define-syntax-rule (define/provide/video mp4-path webm-path path)
  (begin
    (provide mp4-path webm-path)
    (define mp4-path path)
    (define webm-path (append (take mp4-path (sub1 (length mp4-path)))
                              (list (string-replace (last mp4-path) "mp4" "webm"))))
    (set! videos-list
          (append videos-list
                  (list (page mp4-path
                              (apply build-path
                                     (append (list videos)
                                             (drop mp4-path 1))))
                        (page webm-path
                              (apply build-path
                                     (append (list videos)
                                             (drop webm-path 1))))
                        )))                                         
    ))

(define-syntax-rule (define/provide/file file-path path)
  (begin
    (provide file-path)
    (define file-path path)
    (set! files-list
          (append files-list
                  (list (page file-path
                              (apply build-path
                                     (append (list files)
                                             (drop file-path 1))))
                        )))                                           
    ))

(define/provide/image profile-pic-img-path profile-pic-img-webp-path
  (list "img" "index" "profile-pic.jpg"))

(define (imgs)
  (append imgs-list
          videos-list
          files-list))

(define (jpg-path->webp-path jpg-path)
  (and (list? jpg-path)
       (append (take jpg-path (sub1 (length jpg-path)))
               (list (string-replace (last jpg-path) "jpg" "webp")))))

(define (png-path->webp-path png-path)
  (and (list? png-path)
       (append (take png-path (sub1 (length png-path)))
               (list (string-replace (last png-path) "png" "webp")))))

(define (mp4-path->webm-path mp4-path)
  (and (list? mp4-path)
       (append (take mp4-path (sub1 (length mp4-path)))
               (list (string-replace (last mp4-path) "mp4" "webm")))))
