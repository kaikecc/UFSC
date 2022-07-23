
(define (domain envase)

;; Defining options for the planning system
(:requirements :adl :typing)

;; Defining types
(:types
  robot - agent
  conveyor unit - location
  bottle operation pallet - object
)

(:constants
      stop - operation
)

(:predicates
    ;robot
    (robot_available ?robot - robot)
    ;; is the robot available? capacity is one
    (robot_at ?robot - robot ?l - location)
    ;; location of a robot. Either a conveyor or a unit

    ;conveyor
    (conveyor_accepted_bottle ?bottle - bottle ?conv - conveyor)
    ;; constraint on admissible bottles
    (conveyor_available ?conv - conveyor)
    ;; is the conveyor available? capacity is one
    (conveyor_unit ?conv - conveyor ?unit - unit)
    ;; "one-to-many" relation between units and conveyors

    ;unit
    (unit_accepted_bottle ?bottle - bottle ?unit - unit)
    (unit_accepted_conv ?conv - conveyor ?unit - unit) ; #########################################
    ;; constraint on admissible bottles
    (unit_available ?unit - unit)
    ;; is the unit available? unit capacity is one
    (unit_operation ?op - operation ?unit - unit)
    ;; operation provided by the unit

    ;pallet
    (pallet_on_unit ?pallet - pallet ?unit - unit)
    ;; the pallet is in the unit ***
    (pallet_on_conv ?pallet - pallet ?conv - conveyor)
    ;; the pallet is input into the conveyor
    (pallet_on_robot ?pallet - pallet ?robot - robot)
    ;; the robot is at the pallet
    (pallet_completed ?pallet - pallet)
    ;; all the scheduled operations are completed

    ;bottle
    (bottle_on ?bottle - bottle ?pallet - pallet)
    ;; "one-to-one" relation: pallets contain only one type of bottles

    ;stack of operations
    (start ?op - operation ?pallet - pallet)
    ;; ?op is on top of the stack.
    ;; The stack has a one-to-one relation with the pallet (same id)
    (todo ?opontop - operation ?nextop - operation ?pallet - pallet)
    ;; linked list of operations: ?nextop follows ?opontop. Last operation is stop
  )


(:action pickup_pallet_on_unit
  ;?variavel - tipo
    :parameters (?robot - robot ?unit - unit ?pallet - pallet)
    :precondition (and (robot_available ?robot)
                       (robot_at ?robot ?unit)
                       (pallet_on_unit ?pallet ?unit)
                  )
    :effect (and (not (pallet_on_unit ?pallet ?unit))
                 (not (robot_available ?robot))
                 (pallet_on_robot ?pallet ?robot)
                 (unit_available ?unit)
            )
  )

(:action drop_pallet_on_conveyor
    :parameters (?robot - robot ?conv - conveyor ?pallet - pallet ?bottle - bottle)
    :precondition (and (conveyor_available ?conv)
                       (robot_at ?robot ?conv)
                       (pallet_on_robot ?pallet ?robot)
                       (conveyor_accepted_bottle ?bottle ?conv)
                       (bottle_on ?bottle ?pallet)
                  )
    :effect (and (not (conveyor_available ?conv))
                 (not (pallet_on_robot ?pallet ?robot))
                 (pallet_on_conv ?pallet ?conv)
                 (robot_available ?robot))
  )

(:action robot_move
    :parameters (?robot - robot ?from - location ?to - location)
    :precondition (and (robot_at ?robot ?from))
    :effect (and (robot_at ?robot ?to) (not (robot_at ?robot ?from)))
)

(:action conveyor_load_pallet_in_unit
    :parameters (?conv - conveyor ?unit - unit ?pallet - pallet ?bottle - bottle)
    :precondition (and (unit_available ?unit)
                       (conveyor_unit ?conv ?unit)
                       (unit_accepted_bottle ?bottle ?unit)
                       (unit_accepted_conv ?conv ?unit) ; #########################################
                       (bottle_on ?bottle ?pallet)
                       (pallet_on_conv ?pallet ?conv)
                  )
    :effect (and (not (pallet_on_conv ?pallet ?conv))
                 (not (unit_available ?unit))
                 (pallet_on_unit ?pallet ?unit)
                 (conveyor_available ?conv))
)

(:action unit_execute_operation
    :parameters (?unit - unit ?top - operation ?next - operation ?pallet - pallet)
    :precondition (and (unit_operation ?top ?unit)
                       (pallet_on_unit ?pallet ?unit)
                       (start ?top ?pallet)
                       (todo ?top ?next ?pallet)
                  )
    :effect (and
                 (start ?next ?pallet)
                 (not (todo ?top ?next ?pallet))
                 (not (start ?top ?pallet))
            )
)

(:action pallet_completed
    :parameters (?op - operation ?pallet - pallet ?unit - unit)
    :precondition (and (start stop ?pallet)
                       (pallet_on_unit ?pallet ?unit)
                  )
    :effect (and (pallet_completed ?pallet)
                 (unit_available ?unit)
                 (not (pallet_on_unit ?pallet ?unit)))
)
)
