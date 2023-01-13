import 'package:flutter/material.dart';
import 'package:seatfinder/core/constants.dart';
import 'package:seatfinder/screens/widgets/seat.dart';


Widget bottomSeats(int birthNumber, int findSeatNumber){
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bottomSeat(birthNumber, findSeatNumber),
          const SizedBox(width: 1),
          bottomSeat(birthNumber + 1, findSeatNumber),
          const SizedBox(width: 1),
          bottomSeat(birthNumber + 2, findSeatNumber)
        ],
      ),
      SizedBox(
        height: Globals.sideSeatHeight/2,
        width: Globals.sideSeatWidth*3 + 8,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: Globals.sideSeatHeight/2 - 6,
                  decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(3), topRight: Radius.circular(3))
                  ),
                ),
                Container(
                  width: 6,
                  height: Globals.sideSeatHeight/2 - 6,
                  decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(3), topLeft: Radius.circular(3))
                  ),
                )
              ],
            ),
            Container(
              width: double.maxFinite,
              height: 6,
              color: Colors.lightBlue,
            ),

          ],
        ),
      ),

    ],
  );
}