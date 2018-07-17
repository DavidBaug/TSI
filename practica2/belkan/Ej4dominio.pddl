;;Ejercicio 1.a Representar en el dominio los objeto del mundo (jugador
;;personajes, tipos de objeto y las zonas del mundo)
(define (domain ejercicio1-domain)
  (:requirements :strips :equality :typing)
  (:types
    orientacion
    persiana objeto - localizable
    personaje jugador - persiana
    zona
    tipo
    mochila

  )

  ;♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝
  ;♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝


  ;;Ejercicio 1.b  predicados  que  permitan  describir  los  estados  del  mundo
  (:functions
    (caminoActual)
    (coste ?a ?b - zona)
    (puntos ?j - jugador)
  )

  ;♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝
  ;♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝


  (:predicates
    ;Jugador no tiene objeto
    (manoVacia ?j - jugador)

    ;Jugador tiene un objeto
    (manoLlena ?j - jugador ?o - objeto)

    ;Localizacion
    (at ?l - localizable ?z - zona)

    ;Orietnacion
    (orientado ?p - jugador ?o - orientacion)

    ;Personaje tiene objeto
    (tener ?p - personaje)

    ;Plnificar ruta
    (ruta ?a - zona ?b - zona ?l - orientacion)

    ;Mochila esta vacia
    (mochilaVacia ?m - mochila)

    ;Mochila tiene un objeto
    (mochilaLLena ?m - mochila ?o - objeto)

    ;Tipo zona (agua, bosque, piedra, precipici)
    (tipoZona ?z - zona ?t - tipo)
  )

  ;♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝
  ;♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝


  ;;Ejercicio 1.c
  ;Mover entre zonas; Añadido coste
  (:action IR
    :parameters (?j - jugador ?l - orientacion ?z - zona ?z2 - zona ?t - tipo ?m - mochila)
    :precondition (and (orientado ?j ?l) (at ?j ?z) (ruta ?z ?z2 ?l) (not (= ?t Precipicio)) (tipoZona ?z2 ?t)
                  (or
                    (and (not (= ?t Bosque)) (not (= ?t Agua)))
                    (and (= ?t Bosque) (or (mochilaLLena ?m zapatillas) (manoLlena ?j zapatillas)))
                    (and (= ?t Agua) (or (mochilaLLena ?m bikini) (manoLlena ?j bikini)) )
                  ))
    :effect (and (increase (caminoActual) (coste ?z ?z2)) (not (at ?j ?z)) (at ?j ?z2))
  )
  ;Coger objeto
  (:action COGER
    :parameters (?j - jugador ?o - objeto ?z - zona)
    :precondition (and (at ?j ?z) (at ?o ?z) (manoVacia ?j))
    :effect (and (not (manoVacia ?j)) (manoLlena ?j ?o) (not (at ?o ?z)))
  )
  ;Djear objeto
  (:action DEJAR
    :parameters (?j - jugador ?o - objeto ?z - zona)
    :precondition (and (at ?j ?z) (manoLLena ?j ?o))
    :effect (and (not (manoLlena ?j ?o)) (manoVacia ?j) (at ?o ?z))
  )
  ;Dar un objeto a un personaje
  (:action ENTREGAR
    :parameters (?j - jugador ?o - objeto ?z - zona ?p - personaje)
    :precondition (and (at ?j ?z) (at ?p ?z) (manoLLena ?j ?o)(not (= ?o bikini)) (not (= ?o zapatillas)));No entregamos objeto usables
    :effect(and
              (when (and (= ?p LeonardoDiCaprio) (= ?o oscar)) (increase (puntos ?j) 10))
              (when (and (= ?p LeonardoDiCaprio) (= ?o rosas)) (increase (puntos ?j) 1))
              (when (and (= ?p LeonardoDiCaprio) (= ?o manzana)) (increase (puntos ?j) 3))
              (when (and (= ?p LeonardoDiCaprio) (= ?o algoritmos)) (increase (puntos ?j) 4))
              (when (and (= ?p LeonardoDiCaprio) (= ?o oro)) (increase (puntos ?j) 5))

              (when (and (= ?p Princesa) (= ?o oscar)) (increase (puntos ?j) 5))
              (when (and (= ?p Princesa) (= ?o rosas)) (increase (puntos ?j) 10))
              (when (and (= ?p Princesa) (= ?o manzana)) (increase (puntos ?j) 1))
              (when (and (= ?p Princesa) (= ?o algoritmos)) (increase (puntos ?j) 3))
              (when (and (= ?p Princesa) (= ?o oro)) (increase (puntos ?j) 4))

              (when (and (= ?p Bruja) (= ?o oscar)) (increase (puntos ?j) 4))
              (when (and (= ?p Bruja) (= ?o rosas)) (increase (puntos ?j) 5))
              (when (and (= ?p Bruja) (= ?o manzana)) (increase (puntos ?j) 10))
              (when (and (= ?p Bruja) (= ?o algoritmos)) (increase (puntos ?j) 1))
              (when (and (= ?p Bruja) (= ?o oro)) (increase (puntos ?j) 3))

              (when (and (= ?p Profesor) (= ?o oscar)) (increase (puntos ?j) 3))
              (when (and (= ?p Profesor) (= ?o rosas)) (increase (puntos ?j) 4))
              (when (and (= ?p Profesor) (= ?o manzana)) (increase (puntos ?j) 5))
              (when (and (= ?p Profesor) (= ?o algoritmos)) (increase (puntos ?j) 10))
              (when (and (= ?p Profesor) (= ?o oro)) (increase (puntos ?j) 1))

              (when (and (= ?p Principe) (= ?o oscar)) (increase (puntos ?j) 1))
              (when (and (= ?p Principe) (= ?o rosas)) (increase (puntos ?j) 3))
              (when (and (= ?p Principe) (= ?o manzana)) (increase (puntos ?j) 4))
              (when (and (= ?p Principe) (= ?o algoritmos)) (increase (puntos ?j) 5))
              (when (and (= ?p Principe) (= ?o oro)) (increase (puntos ?j) 10))

              (not (manoLLena ?j ?o)) (manoVacia ?j) (tener ?p)
            )
  )
  ;Giro izquierda
  (:action GIRAR-IZQUIERDA
    :parameters (?j - jugador ?l - orientacion)
    :precondition (orientado ?j ?l)
    :effect (and
              (when (= ?l norte) (and (not(orientado ?j ?l))(orientado ?j oeste)))
              (when (= ?l este) (and (not(orientado ?j ?l))(orientado ?j norte)))
              (when (= ?l sur) (and (not(orientado ?j ?l))(orientado ?j este)))
              (when (= ?l oeste) (and (not(orientado ?j ?l))(orientado ?j sur)))
            )
  )
  ;Giro derecha
  (:action GIRAR-DERECHA
    :parameters (?j - jugador ?l - orientacion)
    :precondition (orientado ?j ?l)
    :effect (and
              (when (= ?l norte) (and (not(orientado ?j ?l))(orientado ?j este)))
              (when (= ?l este) (and (not(orientado ?j ?l))(orientado ?j sur)))
              (when (= ?l sur) (and (not(orientado ?j ?l))(orientado ?j oeste)))
              (when (= ?l oeste) (and (not(orientado ?j ?l))(orientado ?j norte)))
            )
  )

  ;Guardar objeto que tiene en la mano en la mochila
  (:action GUARDAR-MOCHILA
    :parameters (?j - jugador ?m - mochila ?o - objeto)
    :precondition (and (manoLLena ?j ?o) (mochilaVacia ?m))
    :effect (and (not (mochilaVacia ?m)) (mochilaLLena ?m ?o) (not (manoLLena ?j ?o)) (manoVacia ?j))
  )

  ;Sacar objeto de la mochila - Se equipa objeto en la mano
  (:action SACAR-MOCHILA
    :parameters (?j - jugador ?m - mochila ?o - objeto)
    :precondition (and (manoVacia ?j) (mochilaLlena ?m ?o))
    :effect (and (not (mochilaLLena ?m ?o)) (mochilaVacia ?m) (manoLLena ?j ?o) (not (manoVacia ?j)))
  )
)
