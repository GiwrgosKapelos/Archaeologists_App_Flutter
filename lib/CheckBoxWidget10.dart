// ignore_for_file: no_logic_in_create_state, prefer_const_constructors


import 'package:flutter/material.dart';
import 'SearchWidget.dart';
import 'main.dart';

var items = [];
Map<String, bool> items2 = {};

bool dropdownflag = false;

class CheckBox10 extends StatefulWidget {
  const CheckBox10();

  @override
  State<StatefulWidget> createState() {
    if (dropdownflag == false) {
      CheckBox4Val = CheckB4;
      for (int i = 0; i < basei!.length; i++) {
        String value = basei![i].toString();
        items.add(
          value.replaceAll('[', '').replaceAll(']', '').replaceAll('  ', ''),
        );
        //CheckB1[items.elementAt(i)] = false;
        //print(CheckB1);
      }
      dropdownflag = true;
    }
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<CheckBox10> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        for (int i = 0; i < items.length; i++)
          Column(children: [
            Text(
              items[i],
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: (CheckB4[items.elementAt(i)]),
              onChanged: (bool? value) {
                setState(() {
                  CheckB4[items.elementAt(i)] = value!;
                  CheckBox4Val = CheckB4;
                });
              },
            ),
          ]),
      ]),
    );
  }
}
