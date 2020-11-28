import 'package:flutter/material.dart';
import 'package:primer_chapoteo/features/new_card_screen.dart';
import 'package:primer_chapoteo/global/custom_color.dart';
import 'package:primer_chapoteo/ui/item_button.dart';
import 'package:table_calendar/table_calendar.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymenScreenState createState() => _PaymenScreenState();
}

class _PaymenScreenState extends State<PaymentScreen> {
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
              SizedBox(
                height: 30,
              ),
              Text(
                "Payments",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(bottom: 30),
                child: TableCalendar(
                  calendarController: _calendarController,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  formatAnimation: FormatAnimation.slide,
                  headerStyle: HeaderStyle(
                      leftChevronIcon: Icon(Icons.chevron_left,color: Colors.white,),
                    rightChevronIcon: Icon(Icons.chevron_right,color: Colors.white,),
                    titleTextStyle: TextStyle(color:Colors.white),
                    formatButtonVisible: false,
                    centerHeaderTitle: true,
                  ),
                  calendarStyle: CalendarStyle(
                    weekendStyle: TextStyle(color: Colors.white),
                    weekdayStyle: TextStyle(color: Colors.white),
                    selectedColor: CustomColor.mainColor,
                    outsideDaysVisible: false,
                  ),
                ),
                decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(right: 40),
                child: ItemButton(
                  width: 120,
                  heigth: 45,
                  textColor: Colors.white,
                  buttonColor: CustomColor.mainColor,
                  text:  "ADD",
                  action: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NewCardScreen()));
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
