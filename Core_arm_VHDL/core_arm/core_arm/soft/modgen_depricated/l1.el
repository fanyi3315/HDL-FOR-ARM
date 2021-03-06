; Konrad Eisele <eiselekd@web.de>
; cdef_lib_l1.el: Some list functions
;-----------------------------------------------------------------------

;(copy-without-nil '(1 () 2))
(defun copy-without-nil (e)
  (remq '() e))


;(add-in '((1)()(3 2)) 4 '())
(defun add-in (v p s)
  "Push into a list of lists"
  (let ((r v))
    (if (<= (length v) p)
      (setq r (append r (make-list (- (+ p 1) (length v)) '())))
    )
    (if (not (null s))
	(setq r (mappos (function (lambda (x pos) 
           (if (eq p pos)
              `,(append x `(,s))
	      `,x
           )
        )) r))
        `,r
    )
  )
)

;(add-in2 '((1)()(3 2)) 4 10 4)
(defun add-in2 (v p1 p2 s)
  "Push into a list of lists"
  (let ((r v))
    (if (<= (length v) p1)
      (setq r (append r (make-list (- (+ p1 1) (length v)) '())))
    )
    (if (not (null s))
	(setq r (mappos (function (lambda (x pos) 
           (if (eq p1 pos)
              `,(add-in x p2 s)
	      `,x
           )
        )) r))
        `,r
    )
  )
)


(defun rec-copy-list-func (e)
  (if (listp e)
      (mapcar 'rec-copy-list-func e)
   `,e)
)

;(rec-copy-list '(1 () 2))
(defun rec-copy-list (l)
  "Copy list"
  (mapcar 'rec-copy-list-func l)
)

(defun cut-copy-list (l start end)
  "Copy list and cut range"
  (let ((c (rec-copy-list l)))
    (if (<= end 0)
	(setq c '())
	(if (<= end (length c))
	    (setcdr (nthcdr (- end 1) c) '())
	)
    )
    (nthcdr start c)
  )
)

(defun cmp* (l e)
  "check weather <l> is (make-list x e)"
  (let ((v 't)
	(el))
    (dolist (el l v) 
      (if (not (eq el e)) 
	  (setq v '())
      )
    )
  )
)

;(setq l1 '(1 2))
;(setq l2 '(3 4 1 2 2 5))
;(remq* l1 l2)
(defun remq* (ol l)
  (let ((e '())
	(v (rec-copy-list l)))
    (dolist (e ol v)
      (setq v (remq e v)))
  )
)


(defun print-list (e)
  (cond ((stringp e)
	 `,e)
	((listp e)
	 (concat " ( " (mapconcat 'print-list e " ") " ) " ))
	((symbolp e)
	 (symbol-name e))
	((numberp e)
	 (number-to-string e))
	((hash-table-p e)
	 (let ((p " { hash=>\n"))
	   (maphash (function (lambda (k v)
	      (setq p (concat p (print-list k) ":" (print-list (list  v ) ) ))
	      ))
            e )
	    (concat p " } "))
	)
	(t "?")))


