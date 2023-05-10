//This isget Started page

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
              icon: const Icon(Icons.send),
              onPressed: () {
                _sendMessage();
              },
            ),

          ],
        ),
      ],
    );
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
        body: Container(
          color: Colors.black,
          child: SafeArea(
            child: Column(
              children: [
                Flexible(
                    child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.all(5),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: index%2==0?
                          Icon(Icons.person,
                          color: Colors.blue,
                          ):
                           Icon(
                             Icons.sports_gymnastics_outlined,
                             color: Colors.red,
                           )
                          ,

                          title: Text(_messages[index],

                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                          ),
                        );
                        // return Text(_messages[index],
                        //
                        // style: TextStyle(
                        //   height: 2,
                        //   fontWeight: FontWeight.bold,
                        //   fontSize: 20
                        // ),
                        // );
                      },
                    )),

                const Divider(
                  height: 1.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: _buildTextComposer(),
                )
              ],
            ),
          ),
        )
    );
  }
}
