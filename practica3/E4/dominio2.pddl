(define (domain zeno-travel)


(:requirements
  :typing
  :fluents
  :derived-predicates
  :negative-preconditions
  :universal-preconditions
  :disjuntive-preconditions
  :conditional-effects
  :htn-expansion

  ; Requisitos adicionales para el manejo del tiempo
  :durative-actions
  :metatags
 )

(:types aircraft person city - object)
(:constants slow fast - object)
(:predicates (at ?x - (either person aircraft) ?c - city)
             (in ?p - person ?a - aircraft)
             (different ?x ?y) (igual ?x ?y)
             (hay-fuel ?a ?c1 ?c2)
             ;Ejercicio 3
             (fuel-maximo ?a - aircraft ?c1 - city ?c2 - city); Combustible máximo
             (slow-fly ?a - aircraft ?c1 - city ?c2 - city) ; Vuelo lento
             (fast-fly ?a - aircraft ?c1 - city ?c2 - city) ; Vuelo rápido
             ;Ejercicio 4 - a
             (plaza-libre ?a)
             ;Ej 4 - b
             (destino ?p - person ?c1 - city)
             ;Ej 4c
             (fast-time ?a  ?c1 ?c2 )
             (slow-time ?a ?c1 ?c2 )

             )
(:functions (fuel ?a - aircraft)
            (distance ?c1 - city ?c2 - city)
            (slow-speed ?a - aircraft)
            (fast-speed ?a - aircraft)
            (slow-burn ?a - aircraft)
            (fast-burn ?a - aircraft)
            (capacity ?a - aircraft)
            (refuel-rate ?a - aircraft)
            (total-fuel-used)
            (boarding-time)
            (debarking-time)
            (fuel-limit)

            ;Ej 4 a
            (pasajeros ?a - aircraft)
            (capacidad-maxima ?a - aircraft)

            ;Ej 4c
            (total-time-used)
            (duration-slow)
            (duration-fast)

            (equivalente ?c1 - city ?c2 - city)

            )

;; el consecuente "vac�o" se representa como "()" y significa "siempre verdad"
(:derived
  (igual ?x ?x) ())

(:derived
  (different ?x ?y) (not (igual ?x ?y)))



;; este literal derivado se utiliza para deducir, a partir de la información en el estado actual,
;; si hay fuel suficiente para que el avión ?a vuele de la ciudad ?c1 a la ?c2
;; el antecedente de este literal derivado comprueba si el fuel actual de ?a es mayor que 1.
;; En este caso es una forma de describir que no hay restricciones de fuel. Pueden introducirse una
;; restricción más copleja  si en lugar de 1 se representa una expresión más elaborada (esto es objeto de
;; los siguientes ejercicios).

; EJERCICIO 3 ------------------------------------------------------------------
(:derived
  (hay-fuel ?a - aircraft ?c1 - city ?c2 - city)
  (>= (fuel ?a) (* (distance ?c1 ?c2) (slow-burn ?a)))
)

  (:derived
    (fuel-maximo ?a - aircraft ?c1 - city ?c2 - city)
    (>= (fuel ?a) (* (distance ?c1 ?c2) (fast-burn ?a)))
  )

  ; El viaje debe darse siempre que el combustible gastado sea menor al límite de combustible (1500)

  (:derived
    (slow-fly ?a - aircraft ?c1 - city ?c2 - city)
    (< (+ (* (distance ?c1 ?c2) (slow-burn ?a)) (total-fuel-used)) (fuel-limit))
  )

  (:derived
    (fast-fly ?a - aircraft ?c1 - city ?c2 - city)
    (< (+ (* (distance ?c1 ?c2) (fast-burn ?a)) (total-fuel-used)) (fuel-limit))
  )

  ;Ej 4 a
  (:derived
    (plaza-libre ?a - aircraft)
    (< (pasajeros ?a) (capacidad-maxima ?a))
  )


  ; Ej 4c
  (:derived
    (slow-time ?a - aircraft ?c1 - city ?c2 - city)
    (< (+ (total-time-used) (* (distance ?c1 ?c2) (duration-slow))) 10000)
  )

  (:derived
    (fast-time ?a - aircraft ?c1 - city ?c2 - city)
    (< (+ (total-time-used) (* (distance ?c1 ?c2) (duration-fast))) 10000)
  )


  (:task transport-person
  	:parameters ()
    (:method Case1 ;si la persona está en el avión y en destino - desembarca
     :precondition (and (in ?p - person ?a - aircraft)
                        (at ?a - aircraft ?c1 - city)
                        (destino ?p - person ?c2 - city)
                        (= ?c1 ?c2)
                   )

     :tasks (
             (debark ?p ?a ?c2)
             (transport-person)
            )
     )

;-------------------------------------------------------------------------------

    (:method Case2; si la persona no está en destino, el avión en destino - avion recoge pers
      :precondition (and (at ?p - person ?c1 - city)
                         (at ?a - aircraft ?c2 - city)
                         (destino ?p - person ?c3 - city)
                         ;(plaza-libre ?a)
                         (= ?c2 ?c3)
                         (not(= ?c1 ?c2))
                    )
      :tasks(
             (mover-avion ?a ?c2 ?c1)
             (board ?p ?a ?c1)
             (transport-person)
            )
    )


    (:method Case3; si la persona no está en destino, el avión en distinto - avion recoge pers
      :precondition (and (at ?p - person ?c1 - city)
                         (at ?a - aircraft ?c2 - city)
                         (destino ?p - person ?c3 - city)
                         ;(plaza-libre ?a)
                         (not(= ?c1 ?c2))
                         (not(= ?c1 ?c3))
                         (not(= ?c3 ?c2))
                    )
      :tasks(
             (mover-avion ?a ?c2 ?c1)
             (board ?p ?a ?c1)
             (transport-person)
            )
    )


;-------------------------------------------------------------------------------

    (:method Case4 ;si la persona está en misma ciudad que avión, y en ciudad diferente destino - embarca
     :precondition (and (at ?p - person ?c1 - city)
                        (at ?a - aircraft ?c1 - city)
                        (destino ?p - person ?c2 - city)
                        ;(plaza-libre ?a)
                        (= ?c1 ?c1)
                        (not(= ?c1 ?c2))
                   )

     :tasks (
             (board ?p ?a ?c1)
             (transport-person)
            )
     )

    (:method Case5 ;si la persona está en el avión y no está destino - ir a destino
     :precondition (and (in ?p - person ?a - aircraft)
                        (at ?a - aircraft ?c1 - city)
                        (destino ?p - person ?c2 - city)
                        (not (= ?c1 ?c2))
                   )

     :tasks (
             (mover-avion ?a ?c1 ?c2)
             (transport-person)
            )
     )

     (:method Case6 ; si la persona está en destino . nada
   	 :precondition (and (at ?p ?c)
                         (destino ?p - person ?c - city)
                         (= ?c ?c)
                    )
   	 :tasks ()
      )

  )

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------

(:task mover-avion
 :parameters (?a - aircraft ?c1 - city ?c2 -city)

; En caso de que tengamos el máximo combustible viajamos rápido
 (:method fuel-maximo
   :precondition (and (fuel-maximo ?a ?c1 ?c2)
                      (hay-fuel ?a ?c1 ?c2)
                      (fast-fly ?a ?c1 ?c2)
                      (fast-time ?a ?c1 ?c2))
   :tasks(
           (zoom ?a ?c1 ?c2)
          )

  )

  ; No tenemos combustible máximo
  (:method no-fuel-maximo
    :precondition (and (not(fuel-maximo ?a ?c1 ?c2))
                        (not(hay-fuel ?a ?c1 ?c2))
                        (fast-fly ?a ?c1 ?c2)
                        (fast-time ?a ?c1 ?c2))
    :tasks(
      (refuel ?a ?c1)
      (zoom ?a ?c1 ?c2)

    )
  )

  ; Para los métodos anteriores añadimos que el tipo de viaje sea lento

  (:method fuel-suficiente
   :precondition (and(hay-fuel ?a ?c1 ?c2)
                      (not(fuel-maximo ?a ?c1 ?c2))
                      (slow-fly ?a ?c1 ?c2)
                      (slow-time ?a ?c1 ?c2))
   :tasks (
           (fly ?a ?c1 ?c2)
          )
  )

  (:method no-fuel-suficiente
    :precondition (and(not(hay-fuel ?a ?c1 ?c2))
                      (not(fuel-maximo ?a ?c1 ?c2))
                      (slow-fly ?a ?c1 ?c2)
                      (slow-fly ?a ?c1 ?c2))
    :tasks (
      (refuel ?a ?c1)
      (fly ?a ?c1 ?c2)

    )
  )

  (:method swap-ciudades
    :precondition (and (distance ?c2 ?c1)(not (distance ?c1 ?c2))
                  )

    :tasks (
             (equivalente ?c2 ?c1)
             (mover-avion ?a ?c1 ?c2)
           )
  )




  )

(:import "Primitivas-Zenotravel3.pddl")


)
