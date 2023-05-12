import 'package:flutter/material.dart';
class bmicalc extends StatefulWidget {
  const bmicalc({Key? key}) : super(key: key);

  @override
  State<bmicalc> createState() => _bmicalcState();
}

class _bmicalcState extends State<bmicalc> {
  double _height = 150.0;
  double _weight = 50.0;

  void _calculateBMI() {
    double heightInMeters = _height / 100;
    double bmi = _weight / (heightInMeters * heightInMeters);
    print('BMI: $bmi');

    setState(() {

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Image.asset(
              'images/38988614.jpg'
            ),
            content: Text('Your BMI is ${bmi.toStringAsFixed(1)}.'),
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


    // add your logic to display the calculated BMI here
  }
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
            SizedBox(height: 50.0),
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
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }
}
