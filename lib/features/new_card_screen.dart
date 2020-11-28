import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:primer_chapoteo/global/custom_color.dart';

class NewCardScreen extends StatefulWidget {
  @override
  _NewCardScreenState createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  static Widget mainColor = new Container(
    width: double.maxFinite,
    height: double.maxFinite,
    color: CustomColor.mainColor,
  );

  String cardNumber = "";
  String cvv = "";
  bool showBackSide = false;
  TextEditingController carNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  FocusNode focusNodeCardNumber = FocusNode();
  FocusNode focusNodeCVV = FocusNode();

  @override
  void initState() {
    focusNodeCVV.addListener(() {
      if(focusNodeCVV.hasFocus){
        showBackSide = true;
      }else{
        showBackSide = false;
      }
      setState(() {
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CreditCard(
                    cardHolderName: "CHUPETIN",
                    cardExpiry: "10/25",
                    cardNumber: cardNumber,
                    cvv: cvv,
                    showShadow: true,
                    bankName: "GA BANK",
                    showBackSide: showBackSide,
                    frontBackground: _NewCardScreenState.mainColor,
                    backBackground: CardBackgrounds.white),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  focusNode: focusNodeCardNumber,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,

                    maxLength: 16,
                    onChanged: (text) {
                      cardNumber = text;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      counterText: "",
                    )),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    focusNode: focusNodeCVV,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    onChanged: (text) {
                      print(text);
                      cvv = text;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      counterText: "",
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
