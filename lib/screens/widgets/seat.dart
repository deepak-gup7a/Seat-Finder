import 'package:flutter/material.dart';
import '../../core/constants.dart';

Widget topSeat(int birthNumber, int findSeatNumber) {
  bool toggle = birthNumber == findSeatNumber;
  return Container(
    height: Globals.sideSeatHeight,
    width: Globals.sideSeatWidth,
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: toggle ? Colors.blue :Colors.lightBlue.shade50,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 4),
        Text('$birthNumber', style: TextStyle(color: toggle ? Colors.white : Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
        Text(Globals.seatType[birthNumber%8].toString(), style: TextStyle(color: toggle ? Colors.white : Colors.blue, fontSize: 8),)
      ],
    ),
  );

}

Widget bottomSeat(int birthNumber, int findSeatNumber) {
  bool toggle = birthNumber == findSeatNumber;
  return Container(
    height: Globals.sideSeatHeight,
    width: Globals.sideSeatWidth,
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: toggle ? Colors.blue :Colors.lightBlue.shade50,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(Globals.seatType[birthNumber%8].toString(), style: TextStyle(color: toggle ? Colors.white : Colors.blue, fontSize: 8),),
        Text('$birthNumber', style: TextStyle(color: toggle ? Colors.white : Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
      ],
    ),
  );

}
