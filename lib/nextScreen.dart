//This isget Started page
import 'models/api/apicall.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
TextEditingController _query= new TextEditingController();
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
    if (_controller.text.isEmpty) return;
    setState(() {
      _messages.insert(0, _controller.text);
    });


    Uri url = Uri.parse('https://chatgym.onrender.com/?msg=${_controller.text}');
    print(url.toString());
    http.Response response = await http.get(url);
    print(response.body);
    Map<String,dynamic>json= jsonDecode(response.body);
    print(json.toString());
    _messages.insert(0, json["reply"]);
    _controller.clear();
    setState(() {

    });


  }
  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: const InputDecoration.collapsed(
                hintText: "Enter your height and weight to know gym plan"),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: const Icon(Icons.send,


              ),
              onPressed: () {
                _sendMessage();
              },
            ),

          ],
        ),
      ],
    );
  }
  double _height = 150.0;
  double _weight = 50.0;
  double _age= 40.0;
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
            SizedBox(height: 20,),

            TextFormField(
              controller: _query,
            ),
            SizedBox(height: 100,),
            ElevatedButton(
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
                    return Colors.lightGreen;
                  },
                ),
              ),
              onPressed:() async
              {
                final res= await Api.exercise(_query.text);
                setState(() {

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return  AlertDialog(
                        title: Text(res.elementAt(0)['title']),
                        content: Text(res.elementAt(0)['ingredients']),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                });
                print(res.elementAt(0).toString());


              },
              child: Text('Get Recipe curated for You!',
              ),

            ),
          ],
        ),
      ),
    );
  }
}
