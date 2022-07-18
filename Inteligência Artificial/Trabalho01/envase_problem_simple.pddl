(define (problem envase_simple)
  (:domain envase)
  (:objects
    unit1 silo - unit
    conv1 - conveyor
    robot1 - robot

    pallet1 - pallet
    bottle1 - bottle

    op10 op20 op30 - operation
  )

  (:init
    ;;Operation schedule

    (start op10 pallet1)
    (todo op10 op20 pallet1)
    (todo op20 op30 pallet1)
    (todo op30 stop pallet1)

    ;;Initiate bottle / pallet
    (bottle_on bottle1 pallet1)

    (pallet_on_unit pallet1 silo)

    ;;Initiate robot
    (robot_at robot1 silo)
    (robot_available robot1)

    ;;Initiate conveyor
    (conveyor_unit conv1 unit1)


    ;;Setup unit
    (unit_accepted_conv conv1 unit1) ; ########

    (unit_accepted_bottle bottle1 unit1)
    (unit_accepted_bottle bottle1 silo)
    (unit_operation op10 unit1)
    (unit_operation op20 unit1)
    (unit_operation op30 unit1)


    (unit_available unit1)


    ;;Setup conveyor
    (conveyor_accepted_bottle bottle1 conv1)
    (conveyor_available conv1)


    ;;Setup robot
    (robot_available robot1)
  )

  (:goal (and (pallet_completed pallet1)
              )
  )
)
