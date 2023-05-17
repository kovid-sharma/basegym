//This isget Started page
import 'models/api/apicall.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
TextEditingController _query= new TextEditingController();
double _height = 150.0;
double _weight = 50.0;
double _age= 40.0;


String p1="";
String p2="";
String p3="";
String p4="";
String p5="";
String p6="";
String p7="";
class GenderCheckbox extends StatefulWidget {
  @override
  _GenderCheckboxState createState() => _GenderCheckboxState();
}

class _GenderCheckboxState extends State<GenderCheckbox> {
  bool _maleSelected = false;
  bool _femaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _maleSelected,
          onChanged: (bool? value) {
            setState(() {
              _maleSelected = value!;
              _femaleSelected = false;
            });
          },
        ),
        Icon(
          Icons.male,
          color: _maleSelected ? Colors.black : Colors.blue,
        ),
        SizedBox(width: 16.0),
        Checkbox(
          value: _femaleSelected,
          onChanged: (bool? value) {
            setState(() {
              _femaleSelected = value!;
              _maleSelected = false;
            });
          },
        ),
        Icon(
          Icons.female,
          color: _femaleSelected ? Colors.black : Colors.red,
        ),
      ],
    );
  }
}
class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}


class _NextScreenState extends State<NextScreen> {
  TextEditingController _controller=TextEditingController();
  void _sendMessage() async {


    double heightInMeters = _height / 100;
    double bmi = _weight / (heightInMeters * heightInMeters);
    print(bmi);
    String ans='Plans';
    if(bmi<18.5){
      ans=p1;
    }
    else if(bmi>=18.5 && bmi<20)
      {
        ans=p2;
      }
    else if(bmi>=20 && bmi<21.5)
    {
      ans=p3;
    }
    else if(bmi>=21.5 && bmi<23)
    {
      ans=p3;
    }
    else if(bmi>=23 && bmi<24.5)
    {
      ans=p5;
    }
    else if(bmi>=24.5 && bmi<26)
    {
      ans=p6;
    }
    else
    {
      ans=p7;
    }
    Uri url = Uri.parse('https://chatgym.onrender.com/?msg=${_height.toString()}');
    print(url.toString());
    http.Response response = await http.get(url);
    print(response.body);
    Map<String,dynamic>json= jsonDecode(response.body);
    print(json.toString());
    String res= json['reply'];
    _messages.insert(0, json["reply"]);
    _controller.clear();
    setState(() {

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(
            backgroundColor: Colors.black,
            title: Text('Here is Your Plan',
              style: TextStyle(color: Colors.white),

            ),
            content: Text(ans,
              style: TextStyle(color: Colors.white),),
            actions: [
              TextButton(
                child: Text('OK',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });


  }

  final List<String> _messages=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("GYMIFY"),
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.white38,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Height',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Slider(
              value: _height,
              min: 100.0,
              max: 200.0,
              divisions: 100,
              label: _height.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _height = value;
                });
              },
            ),
            SizedBox(height: 30.0),
            Text(
              'Weight',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Slider(
              value: _weight,
              min: 30.0,
              max: 150.0,
              divisions: 120,
              label: _weight.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _weight = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Age',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Slider(
              value: _age,
              min: 10.0,
              max: 60.0,
              divisions: 50,
              label: _age.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _age = value;
                });
              },
            ),
            SizedBox(height: 30.0),



            Text(
              'Gender',
              style: TextStyle(fontSize: 24.0),
            ),
            GenderCheckbox(),
            SizedBox(height: 100,),
           ElevatedButton(


            onPressed: _sendMessage,

            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              fixedSize:  MaterialStateProperty.all(
                  Size(400, 70)
              ),
              elevation: MaterialStateProperty.resolveWith((states) => 10),

              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered) || states.contains(MaterialState.pressed)) {
                    return Colors.blue;
                  }
                  return Colors.lightGreen;
                },
              ),
            ),
            child: Text(
                'Get Plan Curated for you'
            )


        ),
          ],
        ),
      ),
    );
  }
}
