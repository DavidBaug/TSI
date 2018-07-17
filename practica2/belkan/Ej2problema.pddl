;;Ejercicio 1.d
(define (problem ejercicio1-problema2)
    (:domain ejercicio1-domain)
  (:objects
      z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 z21 z22 z23 z24 z25 - zona
      norte sur este oeste - orientacion
      oscar manzana rosas algoritmos oro - objeto
      Princesa Principe Bruja Profesor LeonardoDiCaprio - personaje
      HarryPotter - jugador
  )
  (:init
    (ruta z1 z2 este)
    (ruta z1 z6 sur)
    (ruta z2 z1 oeste)
    (ruta z2 z3 este)
    (ruta z2 z7 sur)
    (ruta z3 z2 oeste)
    (ruta z3 z4 este)
    (ruta z3 z8 sur)
    (ruta z4 z3 oeste)
    (ruta z4 z5 este)
    (ruta z4 z9 sur)
    (ruta z5 z4 oeste)
    (ruta z5 z10 sur)
    (ruta z6 z1 norte)
    (ruta z6 z7 este)
    (ruta z6 z11 sur)
    (ruta z7 z2 norte)
    (ruta z7 z6 oeste)
    (ruta z7 z8 este)
    (ruta z7 z12 sur)
    (ruta z8 z3 norte)
    (ruta z8 z7 oeste)
    (ruta z8 z9 este)
    (ruta z8 z13 sur)
    (ruta z9 z4 norte)
    (ruta z9 z8 oeste)
    (ruta z9 z10 este)
    (ruta z9 z14 sur)
    (ruta z10 z5 norte)
    (ruta z10 z9 oeste)
    (ruta z10 z15 sur)
    (ruta z11 z16 norte)
    (ruta z11 z12 este)
    (ruta z11 z16 sur)
    (ruta z12 z7 norte)
    (ruta z12 z11 oeste)
    (ruta z12 z13 este)
    (ruta z12 z17 sur)
    (ruta z13 z8 norte)
    (ruta z13 z12 oeste)
    (ruta z13 z14 este)
    (ruta z13 z18 sur)
    (ruta z14 z9 norte)
    (ruta z14 z13 oeste)
    (ruta z14 z15 este)
    (ruta z14 z19 sur)
    (ruta z15 z10 norte)
    (ruta z15 z14 oeste)
    (ruta z15 z20 sur)
    (ruta z16 z11 norte)
    (ruta z16 z17 este)
    (ruta z16 z21 sur)
    (ruta z17 z12 norte)
    (ruta z17 z16 oeste)
    (ruta z17 z18 este)
    (ruta z17 z22 sur)
    (ruta z18 z13 norte)
    (ruta z18 z17 oeste)
    (ruta z18 z19 este)
    (ruta z18 z23 sur)
    (ruta z19 z14 norte)
    (ruta z19 z18 oeste)
    (ruta z19 z20 este)
    (ruta z19 z24 sur)
    (ruta z20 z15 norte)
    (ruta z20 z19 oeste)
    (ruta z20 z25 sur)
    (ruta z21 z16 norte)
    (ruta z21 z22 este)
    (ruta z22 z17 norte)
    (ruta z22 z21 oeste)
    (ruta z22 z23 este)
    (ruta z23 z18 norte)
    (ruta z23 z22 oeste)
    (ruta z23 z24 este)
    (ruta z24 z19 norte)
    (ruta z24 z23 oeste)
    (ruta z24 z25 este)
    (ruta z24 z20 norte)
    (ruta z25 z24 oeste)

    ;COSTES
    (= (coste z1 z2) 10)
    (= (coste z1 z6) 10)
    (= (coste z2 z1) 10)
    (= (coste z2 z3) 15)
    (= (coste z2 z7) 5)
    (= (coste z3 z2) 15)
    (= (coste z3 z4) 5)
    (= (coste z3 z8) 5)
    (= (coste z4 z3) 5)
    (= (coste z4 z5) 10)
    (= (coste z4 z9) 15)
    (= (coste z5 z4) 10)
    (= (coste z5 z10) 15)
    (= (coste z6 z1) 10)
    (= (coste z6 z7) 15)
    (= (coste z6 z11) 15)
    (= (coste z7 z2) 5)
    (= (coste z7 z6) 15)
    (= (coste z7 z8) 5)
    (= (coste z7 z12) 10)
    (= (coste z8 z3) 5)
    (= (coste z8 z7) 5)
    (= (coste z8 z9) 10)
    (= (coste z8 z13) 15)
    (= (coste z9 z4) 10)
    (= (coste z9 z8) 10)
    (= (coste z9 z10) 10)
    (= (coste z9 z14) 10)
    (= (coste z10 z5) 15)
    (= (coste z10 z9) 10)
    (= (coste z10 z15) 5)
    (= (coste z11 z16) 5)
    (= (coste z11 z12) 20)
    (= (coste z11 z16) 5)
    (= (coste z12 z7) 10)
    (= (coste z12 z11) 20)
    (= (coste z12 z13) 20)
    (= (coste z12 z17) 10)
    (= (coste z13 z8) 15)
    (= (coste z13 z12) 20)
    (= (coste z13 z14) 5)
    (= (coste z13 z18) 10)
    (= (coste z14 z9) 10)
    (= (coste z14 z13) 5)
    (= (coste z14 z15) 5)
    (= (coste z14 z19) 15)
    (= (coste z15 z10) 5)
    (= (coste z15 z14) 5)
    (= (coste z15 z20) 5)
    (= (coste z16 z11) 5)
    (= (coste z16 z17) 10)
    (= (coste z16 z21) 5)
    (= (coste z17 z12) 10)
    (= (coste z17 z16) 10)
    (= (coste z17 z18) 15)
    (= (coste z17 z22) 10)
    (= (coste z18 z13) 10)
    (= (coste z18 z17) 15)
    (= (coste z18 z19) 15)
    (= (coste z18 z23) 25)
    (= (coste z19 z14) 15)
    (= (coste z19 z18) 15)
    (= (coste z19 z20) 20)
    (= (coste z19 z24) 10)
    (= (coste z20 z15) 5)
    (= (coste z20 z19) 20)
    (= (coste z20 z25) 5)
    (= (coste z21 z16) 5)
    (= (coste z21 z22) 25)
    (= (coste z22 z17) 10)
    (= (coste z22 z21) 25)
    (= (coste z22 z23) 5)
    (= (coste z23 z18) 25)
    (= (coste z23 z22) 5)
    (= (coste z23 z24) 15)
    (= (coste z24 z19) 10)
    (= (coste z24 z23) 15)
    (= (coste z24 z25) 5)
    (= (coste z25 z20) 5)
    (= (coste z25 z24) 5)

    (= (caminoActual) 0)

    (at HarryPotter z1)
    (orientado HarryPotter sur)

    (at Principe z12)
    (at Princesa z19)
    (at Bruja z21)
    (at Profesor z17)
    (at LeonardoDiCaprio z10)

    (at manzana z6)
    (at oscar z25)
    (at rosas z4)
    (at oro z8)
    (at algoritmos z23)

    (manoVacia HarryPotter)


  )
  (:metric minimize (caminoActual))
  (:goal (AND (tener Princesa)
              (tener Bruja)
              (tener Profesor)
              (tener LeonardoDiCaprio)
              (tener Principe)
          )
  )
)
