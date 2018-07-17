(define (problem zeno-4-2) (:domain zeno-travel)
(:customization
(= :time-format "%d/%m/%Y %H:%M:%S")
(= :time-horizon-relative 2500)
(= :time-start "05/06/2007 08:00:00")
(= :time-unit :hours))

(:objects
    p1 p2 - person
    almeria barcelona bilbao cadiz cordoba gibraltar granada huelva jaen madrid malaga sevilla - city
    a1 - aircraft
)
(:init
    (at p1 granada)
    (at p2 madrid)

    (at a1 barcelona)

    (destino p1 sevilla)
    (destino p2 granada)

    (= (fuel a1) 1111)
    (= (slow-speed a1) 10)
    (= (fast-speed a1) 20)


    (= (slow-burn a1) 1)
    (= (fast-burn a1) 2)

    (= (capacity a1) 5555)

    (= (refuel-rate a1) 1)

    (= (pasajeros ?a1) 0)
    (= (capacidad-maxima ?a1) 70)


    (= (fuel-limit) 150000)
    (= (total-fuel-used) 0)
    (= (boarding-time) 1)
    (= (debarking-time) 1)

    (= (total-time-used) 0)

    (= (duration-fast) 2)
    (= (duration-slow) 4)

    ; DISTANCES ----------------------------------------------------------------
        ; DISTANCES ----------------------------------------------------------------
            ; DISTANCES ----------------------------------------------------------------
                ; DISTANCES ----------------------------------------------------------------
                    ; DISTANCES ----------------------------------------------------------------

    (= (distance almeria barcelona) 809)
    (= (distance almeria bilbao) 958)
    (= (distance almeria cadiz) 463)
    (= (distance almeria cordoba) 316)
    (= (distance almeria gibraltar) 339)
    (= (distance almeria granada) 162)
    (= (distance almeria huelva) 505)
    (= (distance almeria jaen) 220)
    (= (distance almeria madrid) 547)
    (= (distance almeria malaga) 207)
    (= (distance almeria sevilla) 410)

    (= (distance barcelona bilbao) 620)
    (= (distance barcelona cadiz) 1284)
    (= (distance barcelona cordoba) 908)
    (= (distance barcelona gibraltar) 1124)
    (= (distance barcelona granada) 868)
    (= (distance barcelona huelva) 1140)
    (= (distance barcelona jaen) 804)
    (= (distance barcelona madrid) 621)
    (= (distance barcelona malaga) 997)
    (= (distance barcelona sevilla) 1046)

    (= (distance bilbao cadiz) 1058)
    (= (distance bilbao cordoba) 796)
    (= (distance bilbao gibraltar) 1110)
    (= (distance bilbao granada) 829)
    (= (distance bilbao huelva) 939)
    (= (distance bilbao jaen) 730)
    (= (distance bilbao madrid) 395)
    (= (distance bilbao malaga) 939)
    (= (distance bilbao sevilla) 933)

    (= (distance cadiz cordoba) 261)
    (= (distance cadiz gibraltar) 124)
    (= (distance cadiz granada) 296)
    (= (distance cadiz huelva) 214)
    (= (distance cadiz jaen) 330)
    (= (distance cadiz madrid) 654)
    (= (distance cadiz malaga) 240)
    (= (distance cadiz sevilla) 126)

    (= (distance cordoba gibraltar) 294)
    (= (distance cordoba granada) 160)
    (= (distance cordoba huelva) 241)
    (= (distance cordoba jaen) 108)
    (= (distance cordoba madrid) 396)
    (= (distance cordoba malaga) 165)
    (= (distance cordoba sevilla) 143)

    (= (distance gibraltar granada) 255)
    (= (distance gibraltar huelva) 289)
    (= (distance gibraltar jaen) 335)
    (= (distance gibraltar madrid) 662)
    (= (distance gibraltar malaga) 134)
    (= (distance gibraltar sevilla) 201)

    (= (distance granada huelva) 346)
    (= (distance granada jaen) 93)
    (= (distance granada madrid) 421)
    (= (distance granada malaga) 125)
    (= (distance granada sevilla) 252)

    (= (distance huelva jaen) 347)
    (= (distance huelva madrid) 591)
    (= (distance huelva malaga) 301)
    (= (distance huelva sevilla) 95)

    (= (distance jaen madrid) 335)
    (= (distance jaen malaga) 203)
    (= (distance jaen sevilla) 246)

    (= (distance madrid malaga) 532)
    (= (distance madrid sevilla) 534)

    (= (distance malaga sevilla) 209)


 )


(:tasks-goal
   :tasks(
   (transport-person)

   )
  )
)
