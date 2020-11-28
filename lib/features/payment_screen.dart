import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymenScreenState createState() => _PaymenScreenState();
}

class _PaymenScreenState extends State<PaymentScreen>{
  CalendarController _calendarController;
  @override
  void initState() {
    // TODO: implement initState
    _calendarController = CalendarController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text("Payments",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                SizedBox(height: 30,),

              ],
            ),
          )
        ),
      ),
    );
  }

}

