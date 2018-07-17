; Ejercicio 4a
(:durative-action board
 :parameters (?p - person ?a - aircraft ?c - city)
 :duration (= ?duration (boarding-time))
 :condition (and  (at ?p ?c)
                  (at ?a ?c))
 :effect (and  (not (at ?p ?c))
               (in ?p ?a)
               (increase (pasajeros ?a) 1)))

(:durative-action debark
 :parameters (?p - person ?a - aircraft ?c - city)
 :duration (= ?duration (debarking-time))
 :condition (and (in ?p ?a)
                 (at ?a ?c)
                 (> (pasajeros ?a) 0))
 :effect (and  (not (in ?p ?a))
               (at ?p ?c)
               (decrease (pasajeros ?a) 1)))


;---------------------------------------------------------

(:durative-action fly
 :parameters (?a - aircraft ?c1 ?c2 - city)
 :duration (= ?duration (/ (distance ?c1 ?c2) (slow-speed ?a)))
 :condition (and  (at ?a ?c1)
                  (>= (fuel ?a)
                         (* (distance ?c1 ?c2) (slow-burn ?a))))
 :effect (and  (not (at ?a ?c1))
               (at ?a ?c2)
              (increase (total-fuel-used)
                         (* (distance ?c1 ?c2) (slow-burn ?a)))
              (increase (total-time-used) (+ (total-time-used) (* (distance ?c1 ?c2) (duration-slow))))
              (decrease (fuel ?a)
                         (* (distance ?c1 ?c2) (slow-burn ?a)))))

(:durative-action zoom
 :parameters (?a - aircraft ?c1 ?c2 - city)
 :duration (= ?duration (/ (distance ?c1 ?c2) (fast-speed ?a)))
 :condition (and  (at ?a ?c1)
                  (>= (fuel ?a)
                         (* (distance ?c1 ?c2) (fast-burn ?a))))
 :effect (and (not (at ?a ?c1))
               (at ?a ?c2)
               (increase (total-fuel-used)
                         (* (distance ?c1 ?c2) (fast-burn ?a)))
              (increase (total-time-used) (+ (total-time-used) (* (distance ?c1 ?c2) (duration-fast))))
              (decrease (fuel ?a)
                         (* (distance ?c1 ?c2) (fast-burn ?a)))))

(:durative-action refuel
 :parameters (?a - aircraft ?c - city)
 :duration (= ?duration (/ (- (capacity ?a) (fuel ?a)) (refuel-rate ?a)))
 :condition (and  (> (capacity ?a) (fuel ?a))
                 (at ?a ?c))
 :effect (assign (fuel ?a) (capacity ?a)))


 (:durative-action equivalente
   :parameters (?c1 - city ?c2 - city)
   :duration (= ?duration 0)
   :condition ()
   :effect (assign (distance ?c2 ?c1) (distance ?c1 ?c2))
  )