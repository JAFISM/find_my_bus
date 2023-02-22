import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../color_palette.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bus.jpg"),
              )),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  decoration: BoxDecoration(
                      color: c3,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: _mainwidgets(context))),
        ],
      ),
    );
  }

  Column _mainwidgets(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0)
          ]),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.location_on_outlined),
                ),
                //labelStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(fontSize: 15),
                labelText: "From",
                hintText: 'Search Kochi..',
                hintStyle:
                    const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
                // suffixIcon: Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Icon(Icons.location_on_outlined),
                // ),
                contentPadding: const EdgeInsets.all(15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none)),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0)
          ]),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.send),
                ),
                labelText: "To",
                labelStyle: TextStyle(fontSize: 15),
                hintText: 'Search Kakkanad..',
                hintStyle:
                    const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
                contentPadding: const EdgeInsets.all(15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: DateTimePicker(
            type: DateTimePickerType.dateTimeSeparate,
            dateMask: 'd MMM, yyyy',
            initialValue: DateTime.now().toString(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            icon: Icon(Icons.event),
            dateLabelText: 'Date',
            timeLabelText: "Hour",
            selectableDayPredicate: (date) {
              // Disable weekend days to select from the calendar
              if (date.weekday == 6 || date.weekday == 7) {
                return false;
              }

              return true;
            },
            onChanged: (val) => print(val),
            validator: (val) {
              print(val);
              return null;
            },
            onSaved: (val) => print(val),
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
        //   decoration: BoxDecoration(boxShadow: [
        //     BoxShadow(
        //         color: const Color(0xff1D1617).withOpacity(0.11),
        //         blurRadius: 40,
        //         spreadRadius: 0.0)
        //   ]),
        //   child: TextField(
        //     decoration: InputDecoration(
        //         prefixIcon: Padding(
        //           padding: const EdgeInsets.all(12.0),
        //           child: Icon(Icons.calendar_month_outlined),
        //         ),
        //         labelText: "Date & Time",
        //         labelStyle: TextStyle(fontSize: 15),
        //         //hintText: 'Search Kochi..',
        //         hintStyle:
        //             const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
        //         // suffixIcon: Padding(
        //         //   padding: const EdgeInsets.all(15.0),
        //         //   child: Icon(Icons.location_on_outlined),
        //         // ),
        //         contentPadding: const EdgeInsets.all(15),
        //         filled: true,
        //         fillColor: Colors.white,
        //         border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(15),
        //             borderSide: BorderSide.none)),
        //   ),
        // ),
        // // TextField(),
        // TextField(),
        SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width/1.2,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Search bus"),
            style: ElevatedButton.styleFrom(
                maximumSize: Size(double.infinity, 50),
                backgroundColor: c1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
