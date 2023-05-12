
//this is motivation screen

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/api/apicall.dart';
class RoundedChoiceButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const RoundedChoiceButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        fixedSize:  MaterialStateProperty.all(
            Size(200, 50)
        ),
        elevation: MaterialStateProperty.resolveWith((states) => 2),

        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered) || states.contains(MaterialState.pressed)) {
              return Colors.blue;
            }
            return Colors.black;
          },
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
class calcalc extends StatefulWidget {
  const calcalc({Key? key}) : super(key: key);

  @override
  State<calcalc> createState() => _calcalcState();
}

class _calcalcState extends State<calcalc> {
  TextEditingController _query=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GYMIFY"),
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.white38,
      ),
      body: Column(
        children: [
          Text(
            'Get Motivation!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Center(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.2),
                    RoundedChoiceButton(
                      label: 'Body Building',
                      onPressed: () async{
                        // Add your logic here
                        String limit = "100";
                        final currQuote = await Api.getQuotesLimitTopic(
                            'Body Building', limit);
                        currQuote.shuffle();
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: Text('Your Motivation Quote is\n',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30
                                    ),
                                  ),
                                  content: Text(currQuote.first,

                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text('OK',

                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              }
                          );
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    RoundedChoiceButton(
                      label: 'Work',
                      onPressed: () async{
                        // Add your logic here
                        String limit = "100";
                        final currQuote = await Api.getQuotesLimitTopic(
                            'Work', limit);
                        currQuote.shuffle();
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: Text('Your Motivation Quote is\n',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30
                                    ),
                                  ),
                                  content: Text(currQuote.first,

                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text('OK',

                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              }
                          );
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    RoundedChoiceButton(
                      label: 'Exercise',
                      onPressed: () async{
                        // Add your logic here
                        String limit = "100";
                        final currQuote = await Api.getQuotesLimitTopic(
                            'Exercise', limit);
                        currQuote.shuffle();
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: Text('Your Motivation Quote is\n',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30
                                    ),
                                  ),
                                  content: Text(currQuote.first,

                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text('OK',

                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              }
                          );
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    RoundedChoiceButton(
                      label: 'Workout',
                      onPressed: () async{
                        // Add your logic here
                        String limit = "100";
                        final currQuote = await Api.getQuotesLimitTopic(
                            'Workout', limit);
                        currQuote.shuffle();
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: Text('Your Motivation Quote is\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30
                                    ),
                                  ),
                                  content: Text(currQuote.first,

                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text('OK',

                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              }
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

