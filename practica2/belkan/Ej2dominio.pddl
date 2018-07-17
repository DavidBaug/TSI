;;Ejercicio 1.a Representar en el dominio los objetos del mundo (jugador
;;personajes, tipos de objetos y las zonas del mundo)
(define (domain ejercicio1-domain)
  (:requirements :strips :equality :typing)
  (:types
    orientacion
    persiana objeto - localizable
    personaje jugador - persiana
    zona

  )

  ;♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝
  ;♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝


  ;;Ejercicio 1.b  predicados  que  permitan  describir  los  estados  del  mundo
  (:functions
    (caminoActual)
    (coste ?a ?b - zona)
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
  )

  ;♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝
  ;♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝▀▄♞▀▄▀▄♝


  ;;Ejercicio 1.c
  ;Mover entre zonas; Añadido coste
  (:action IR
    :parameters (?j - jugador ?l - orientacion ?z - zona ?z2 - zona)
    :precondition (and (orientado ?j ?l) (at ?j ?z) (ruta ?z ?z2 ?l))
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
    :precondition (and (at ?j ?z) (at ?p ?z) (manoLLena ?j ?o))
    :effect(and (not (manoLLena ?j ?o)) (manoVacia ?j) (tener ?p))
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
)
