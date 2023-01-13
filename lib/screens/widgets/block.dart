import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatfinder/core/constants.dart';
import 'package:seatfinder/screens/widgets/side_lower.dart';
import 'package:seatfinder/screens/widgets/side_upper.dart';
import 'package:seatfinder/screens/widgets/top_seats.dart';

import 'bottom_seats.dart';

Widget myBlock(int birthNumber, int findSeatNumber) {
  return SizedBox(
      height: Globals.sideSeatHeight * 2.5,
      width: Get.width,
      child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [topSeats(birthNumber, findSeatNumber), bottomSeats(birthNumber + 3, findSeatNumber)],
        ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [sideLower(birthNumber + 6, findSeatNumber), sideUpper(birthNumber + 7, findSeatNumber)],
            ),
      ]));
}
