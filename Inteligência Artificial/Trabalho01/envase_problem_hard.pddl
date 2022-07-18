 (define (problem envase_hard)
  (:domain envase)
  (:objects
    unit1 unit2 unit3 unit4 silo - unit
    conv1 conv2 conv3 conv4 conv5 conv6 conv7 conv8  - conveyor
    robot1 robot2 robot3 robotsilo - robot

    pallet26 pallet27 pallet28 pallet29 pallet30 pallet31 pallet32 pallet33 pallet34 pallet35 pallet36 - pallet
    bottle1 bottle2 bottle3 bottle4 bottle5 - bottle

    op10 op20 op30 - operation
  )

  (:init
    ;;Operation schedule

    (start op10 pallet26)
    (todo op10 op20 pallet26)
    (todo op20 op30 pallet26)
    (todo op30 stop pallet26)

    (start op10 pallet27)
    (todo op10 op20 pallet27)
    (todo op20 op30 pallet27)
    (todo op30 stop pallet27)

    (start op20 pallet28)
    (todo op20 op30 pallet28)
    (todo op30 stop pallet28)

    (start op20 pallet29)
    (todo op20 op30 pallet29)
    (todo op30 stop pallet29)

    (start op10 pallet30)
    (todo op10 op20 pallet30)
    (todo op20 op30 pallet30)
    (todo op30 stop pallet30)

    (start op10 pallet31)
    (todo op10 op20 pallet31)
    (todo op20 op30 pallet31)
    (todo op30 stop pallet31)

    (start op10 pallet32)
    (todo op10 op20 pallet32)
    (todo op20 op30 pallet32)
    (todo op30 stop pallet32)

    (start op30 pallet33)
    (todo op30 stop pallet33)

    (start op30 pallet34)
    (todo op30 stop pallet34)

    (start op30 pallet35)
    (todo op30 stop pallet35)

    (start op30 pallet36)
    (todo op30 stop pallet36)

    ;;Initiate bottle / pallet
    (bottle_on bottle1 pallet26)
    (bottle_on bottle1 pallet27)
    (bottle_on bottle2 pallet28)
    (bottle_on bottle2 pallet29)
    (bottle_on bottle3 pallet30)
    (bottle_on bottle1 pallet31)
    (bottle_on bottle1 pallet32)
    (bottle_on bottle4 pallet33)
    (bottle_on bottle4 pallet34)
    (bottle_on bottle5 pallet35)
    (bottle_on bottle5 pallet36)

    (pallet_on_unit pallet26 silo)
    (pallet_on_unit pallet27 silo)
    (pallet_on_unit pallet28 silo)
    (pallet_on_unit pallet29 silo)
    (pallet_on_unit pallet30 silo)
    (pallet_on_unit pallet31 silo)
    (pallet_on_unit pallet32 silo)
    (pallet_on_unit pallet33 silo)
    (pallet_on_unit pallet34 silo)
    (pallet_on_unit pallet35 silo)
    (pallet_on_unit pallet36 silo)

    ;;Initiate robot
    (robot_at robotsilo silo)
    (robot_at robot1 unit1)
    (robot_at robot2 unit2)
    (robot_at robot3 unit3)
    

    ;;Initiate conveyor
    

    (conveyor_unit conv1 unit1)
    (conveyor_unit conv2 unit1)
    (conveyor_unit conv3 unit2)
    (conveyor_unit conv4 unit2)
    (conveyor_unit conv5 unit2)
    (conveyor_unit conv6 unit3)
    (conveyor_unit conv7 unit3)
    (conveyor_unit conv8 unit4)

    ;;Initiate unit
    (unit_operation op10 unit1)
    (unit_operation op20 unit2)
    (unit_operation op30 unit2)
    (unit_operation op30 unit3)
    (unit_operation op20 unit4)
    (unit_operation op30 unit4)

    ;;Setup unit
    (unit_accepted_conv conv1 unit1) ; ########
    (unit_accepted_conv conv2 unit1) ; ########

    (unit_accepted_conv conv3 unit2) ; ########
    (unit_accepted_conv conv4 unit2) ; ########
    ;(unit_accepted_conv conv5 unit2) ; ########

    (unit_accepted_conv conv5 unit3) ; ########
    (unit_accepted_conv conv6 unit3) ; ########

    (unit_accepted_conv conv7 unit4) ; ########
    (unit_accepted_conv conv8 unit4) ; ########

    (unit_accepted_bottle bottle1 silo)
    (unit_accepted_bottle bottle2 silo)
    (unit_accepted_bottle bottle3 silo)
    (unit_accepted_bottle bottle4 silo)
    (unit_accepted_bottle bottle5 silo)

    
    (unit_accepted_bottle bottle1 unit1)
    (unit_accepted_bottle bottle2 unit1)
    (unit_accepted_bottle bottle3 unit1)
    (unit_accepted_bottle bottle4 unit1)
    (unit_accepted_bottle bottle5 unit1)

    (unit_accepted_bottle bottle1 unit2)
    (unit_accepted_bottle bottle2 unit2)
    (unit_accepted_bottle bottle3 unit2)
   ; (unit_accepted_bottle bottle4 unit2)
  ;  (unit_accepted_bottle bottle5 unit2)

    (unit_accepted_bottle bottle1 unit3)
    (unit_accepted_bottle bottle2 unit3)
    (unit_accepted_bottle bottle3 unit3)
    (unit_accepted_bottle bottle4 unit3)
    (unit_accepted_bottle bottle5 unit3)

    (unit_accepted_bottle bottle1 unit4)
    (unit_accepted_bottle bottle2 unit4)
    (unit_accepted_bottle bottle3 unit4)
    (unit_accepted_bottle bottle4 unit4)
    (unit_accepted_bottle bottle5 unit4)

    (unit_available silo)
    (unit_available unit1)
    (unit_available unit2)
    (unit_available unit3)
    (unit_available unit4)

    ;;Setup conveyor
 

    (conveyor_accepted_bottle bottle1 conv1)
    (conveyor_accepted_bottle bottle2 conv1)
    (conveyor_accepted_bottle bottle3 conv1)
    (conveyor_accepted_bottle bottle4 conv1)

    (conveyor_accepted_bottle bottle1 conv2) ;;
    (conveyor_accepted_bottle bottle2 conv2)
    (conveyor_accepted_bottle bottle3 conv2)
    (conveyor_accepted_bottle bottle4 conv2)
    (conveyor_accepted_bottle bottle5 conv2)

    (conveyor_accepted_bottle bottle1 conv3)
    (conveyor_accepted_bottle bottle2 conv3)
    (conveyor_accepted_bottle bottle3 conv3)
    (conveyor_accepted_bottle bottle4 conv3)
    (conveyor_accepted_bottle bottle5 conv3)

    (conveyor_accepted_bottle bottle2 conv4)
    (conveyor_accepted_bottle bottle3 conv4)
    (conveyor_accepted_bottle bottle4 conv4)
    (conveyor_accepted_bottle bottle5 conv4)

    (conveyor_accepted_bottle bottle1 conv5)

    (conveyor_accepted_bottle bottle1 conv6)
    (conveyor_accepted_bottle bottle2 conv6)
    (conveyor_accepted_bottle bottle3 conv6)

    (conveyor_accepted_bottle bottle4 conv7)
    (conveyor_accepted_bottle bottle5 conv7)

    (conveyor_accepted_bottle bottle1 conv8)
    (conveyor_accepted_bottle bottle2 conv8)
    (conveyor_accepted_bottle bottle3 conv8)
    (conveyor_accepted_bottle bottle4 conv8)
    (conveyor_accepted_bottle bottle5 conv8)

    (conveyor_available conv1)
    (conveyor_available conv2)
    (conveyor_available conv3)
    (conveyor_available conv4)
    (conveyor_available conv5)
    (conveyor_available conv6)
    (conveyor_available conv7)
    (conveyor_available conv8)
   


    ;;Setup robot
    ;(robot_available robotsilo) ;;###### RETIRAR
    (robot_available robot1)
    (robot_available robot2)
    (robot_available robot3)
  )

  (:goal (and (pallet_completed pallet26)
              (pallet_completed pallet27)
              (pallet_completed pallet28)
              (pallet_completed pallet29)
              (pallet_completed pallet30)
              (pallet_completed pallet31)
              (pallet_completed pallet32)
              (pallet_completed pallet33)
              (pallet_completed pallet34)
              (pallet_completed pallet35)
              (pallet_completed pallet36)
              )
  )
)


