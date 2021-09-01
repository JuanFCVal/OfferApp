import 'dart:async';

import 'package:flutter/material.dart';

import 'Input-Register.dart';

class DatePick extends StatefulWidget {
  final Function callback;
  DatePick({Key key, this.callback}) : super(key: key);

  @override
  _DatePickState createState() => _DatePickState(callback);
}

class _DatePickState extends State<DatePick> {
  DateTime selectedDate = DateTime.now();
  String dateob = '';
  String dateStr = '';
  Function callback;
  _DatePickState(this.callback);

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateStr =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
        MyCustomForm(dateob: dateStr.split(' ')[0]);
        callback(dateStr);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(dateStr.split(' ')[0]),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text('Selecciona Fecha de nacimiento'),
            ),
          ],
        ),
      ),
    );
  }
}
