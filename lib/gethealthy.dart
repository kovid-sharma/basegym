import 'models/api/apicall.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

TextEditingController _query= new TextEditingController();
TextEditingController _query1= new TextEditingController();
TextEditingController _query2= new TextEditingController();
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
class GetHealthy extends StatefulWidget {
  const GetHealthy({Key? key}) : super(key: key);

  @override
  State<GetHealthy> createState() => _GetHealthyState();
}
class _GetHealthyState extends State<GetHealthy> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("GYMIFY"),
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.white38,
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100,),
              Text(
                'Enter dish name to get Healthy Recipe',
                style: TextStyle(fontSize: 14.0),
              ),
              TextFormField(
                controller: _query,
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  fixedSize:  MaterialStateProperty.all(
                      Size(300, 40)
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
                onPressed:() async
                {
                  final res= await Api.exercise(_query.text);
                  setState(() {

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return  AlertDialog(
                          backgroundColor: Colors.black,
                          title: Text(res.elementAt(0)['title'],
                            style: TextStyle(color: Colors.white),

                          ),
                          content: Text(res.elementAt(0)['ingredients'],
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
                  print(res.elementAt(0).toString());


                },
                child: Text('Get Recipe curated for You!',
                ),

              ),




              SizedBox(height: 100,),
              Text(
                'Enter your diet to get nutritional information',
                style: TextStyle(fontSize: 14.0),
              ),
              TextFormField(
                controller: _query1,
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  fixedSize:  MaterialStateProperty.all(
                      Size(300, 40)
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
                onPressed:() async
                {
                  final res= await Api.exercise3(_query1.text);
                  setState(() {

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return  AlertDialog(
                          backgroundColor: Colors.black,
                          title: Text(res.elementAt(0)['name'],
                            style: TextStyle(color: Colors.white),

                          ),
                          content: Container(
                            height: MediaQuery.of(context).size.height*0.3,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text('Calories:${res.elementAt(0)['calories']}',


                                      style: TextStyle(color: Colors.white)
                                  ),
                                  SizedBox(height: 6,),
                                  Text('Serving Size:${res.elementAt(0)['serving_size_g']}',


                                      style: TextStyle(color: Colors.white)
                                  ),
                                  SizedBox(height: 6,),
                                  Text('Total Fat:${res.elementAt(0)['fat_total_g']}',


                                      style: TextStyle(color: Colors.white)
                                  ),
                                  SizedBox(height: 6,),
                                  Text('Saturated Fat:${res.elementAt(0)['fat_saturated_g']}',


                                      style: TextStyle(color: Colors.white)
                                  ),
                                  SizedBox(height: 6,),

                                  Text('Proteins:${res.elementAt(0)['protein_g']}',


                                      style: TextStyle(color: Colors.white)
                                  ),
                                  SizedBox(height: 6,),

                                  Text('Carbs:${res.elementAt(0)['carbohydrates_total_g']}',


                                      style: TextStyle(color: Colors.white)
                                  ),
                                  SizedBox(height: 6,),
                                ],
                              ),
                            ),
                          ),

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
                  print(res.elementAt(0).toString());


                },
                child: Text('Get Nutrition Information',
                ),

              ),



              SizedBox(height: 100,),
              Text(
                'Enter activity name to get calories burned',
                style: TextStyle(fontSize: 14.0),
              ),
              TextFormField(
                controller: _query2,
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  fixedSize:  MaterialStateProperty.all(
                      Size(300, 40)
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
                onPressed:() async
                {
                  final res= await Api.exercise2(_query2.text);
                  setState(() {

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return  AlertDialog(
                          backgroundColor: Colors.black,
                          title: Text(res.elementAt(0)['name'],
                            style: TextStyle(color: Colors.white),

                          ),
                          content: Text('The Calories per hour of the Given Activity is:${res.elementAt(0)['calories_per_hour']}',
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
                  print(res.elementAt(0).toString());


                },
                child: Text('Get Calories Burned!',
                ),

              ),
            ],
          ),
        ),

    );
  }
}
