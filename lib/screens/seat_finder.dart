import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seatfinder/core/constants.dart';

import 'widgets/block.dart';


class SeatFinderPage extends StatefulWidget {
  const SeatFinderPage({Key? key}) : super(key: key);

  @override
  State<SeatFinderPage> createState() => _SeatFinderPageState();
}

class _SeatFinderPageState extends State<SeatFinderPage> {
  String findSeatNumber = '';
  bool isFound = false;
  late ScrollController _controller;

  void getSeat() {

    if (kDebugMode) {
      print(findSeatNumber);
    }

    if (findSeatNumber == '' || int.parse(findSeatNumber) > 80 || int.parse(findSeatNumber) < 1) {
      setState(() {
        isFound = false;
        findSeatNumber = '';
      });
      return;
    }
    setState(() {
      moveOffset(int.parse(findSeatNumber));
    });
  }

  moveOffset(int seatNumber){
    _controller.animateTo(_controller.position.minScrollExtent + (seatNumber/8) * Globals.sideSeatHeight * 3 - 200,
        curve: Curves.linear, duration: const Duration(milliseconds: 500));
  }
_scrollListener() {

}

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: Get.height,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Seat Finder',
                style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'OverSea',
                    fontWeight: FontWeight.w900,
                    color: Colors.lightBlue)),
          ),
          SizedBox(
            height: 70,
            width: Get.width,
            child: Stack(
                alignment: Alignment.centerRight,
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: Get.width,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.lightBlue, width: 3)),
                    child: Center(
                      child: TextFormField(
                        initialValue: findSeatNumber,
                        maxLines: 1,
                        onSaved: (val) {
                          findSeatNumber = val.toString();
                          if (kDebugMode) {
                            print(findSeatNumber);
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                        ],
                        onFieldSubmitted: (val) {},
                        textAlign: TextAlign.start,
                        onTap: () {
                          setState(() {});
                        },
                        onChanged: (val) {
                          findSeatNumber = val.toString();
                          if (kDebugMode) {
                            print(findSeatNumber);
                          }
                        },
                        showCursor: true,
                        cursorColor: Colors.lightBlue,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          disabledBorder: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                          hintText: 'Enter Seat Number...',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFound = true;
                        getSeat();
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      decoration: BoxDecoration(
                        color: isFound
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Center(
                          child: Text(
                        'Find',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ),
                  ),
                ]),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: ListView.separated(
                  controller: _controller,
                  itemBuilder: (ctx, index) {
                    int x = 0;
                    if(findSeatNumber != '') {
                      x = int.parse(findSeatNumber);
                    }
                    return myBlock(index * 8 + 1, x);
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(height: 2);
                  },
                  itemCount: 10),
            ),
          ),
        ],
      ),
    )));
  }
}
