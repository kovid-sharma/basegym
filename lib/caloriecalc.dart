
//this is motivation screen

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/api/apicall.dart';

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
          TextFormField(
            controller: _query,
            decoration: InputDecoration(
              hintText: '  Enter the Motivation topic',
              hintStyle: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: ()async
          {
            String limit = "5";
            final currQuote = await Api.getQuotesLimitTopic(
                _query.text.toString(), limit);
            setState(() {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Your Motivation Quote are\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),),
                      content: Text(currQuote.toString()),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }
              );
            });
          }, child: Text('Submit'),
          )
        ],
      ),
    );
  }
}

