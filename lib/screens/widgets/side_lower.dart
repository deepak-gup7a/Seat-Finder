import 'package:flutter/material.dart';
import 'package:seatfinder/screens/widgets/seat.dart';

import '../../core/constants.dart';
Widget sideLower(int birthNumber, int findSeatNumber){
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      topSeat(birthNumber, findSeatNumber),
      SizedBox(
        height: Globals.sideSeatHeight/2,
        width: Globals.sideSeatWidth + 6,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 6,
              color: Colors.lightBlue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: Globals.sideSeatHeight/2 - 6,
                  decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(3), bottomRight: Radius.circular(3))
                  ),
                ),
                Container(
                  width: 6,
                  height: Globals.sideSeatHeight/2 - 6,
                  decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(3), bottomRight: Radius.circular(3))
                  ),
                )
              ],
            )
          ],
        ),
      ),

    ],
  );
}