;gnu clisp  2.49.60

(defun summ (a b) 
    (cond
        (T (+ a b))
    )
)

(defun sub (a b) 
    (cond
        (T (- a b))
    )
)

(defun mult (a b) 
    (cond
        (T (* a b))
    )
)

(defun div (a b) 
    (cond
        (T (/ a b))
    )
)

(defun calc-oper (a b oper)
    (cond
        ((string= oper "+") (summ a b))
        ((string= oper "-") (sub a b))
        ((string= oper "*") (mult a b))
        ((string= oper "/") (div a b))
    )
)

(defun calc-opn (opn)
    (cond
        ( (eq (list-length opn) 3)
            (calc-oper (nth 0 opn) (nth 1 opn) (nth 2 opn))
        )
        ( (numberp (nth 2 opn))
            (calc-opn
                (append 
                    (list (nth 0 opn))
                    (list (calc-oper (nth 1 opn) (nth 2 opn) (nth 3 opn)))
                    (last opn (- (list-length opn) 4))
                )
            )
        )
        ( T
            (calc-opn
                (append 
                    (list (calc-oper (nth 0 opn) (nth 1 opn) (nth 2 opn)))
                    (last opn (- (list-length opn) 3))
                )
            )
         )
    )
)

; установим значение ОПН
(set 'opn (list 2.2 2 "*" 5 2 "-" "*" 3 "-"))

(set 'result (calc-opn opn))
(print result)
