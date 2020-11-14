import 'package:flutter/material.dart';
import 'package:primer_chapoteo/global/custom_color.dart';

class SearchScreen extends StatefulWidget {
  final String typeService;

  SearchScreen({this.typeService});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.typeService);
    return Scaffold(
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.only(left: 20, right: 10, top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image(
                              width: 50,
                              image: AssetImage("assets/images/picture.png")),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: 50,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Expanded(
                                    child: TextField(
                                      maxLines: 1,
                                      maxLength: 200,
                                      style: TextStyle(
                                        fontSize:20,
                                        color: Colors.black
                                      ),
                                      keyboardType: TextInputType.text,
                                      textCapitalization: TextCapitalization.words,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  )

                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: CustomColor.grey,
                                  borderRadius: BorderRadius.circular(20)))
                        ],
                      )
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height)));
  }
}
