import 'package:flutter/material.dart';
class exercise extends StatefulWidget {
  const exercise({Key? key}) : super(key: key);

  @override
  State<exercise> createState() => _exerciseState();
}

class _exerciseState extends State<exercise> {
  final List<String> _chestExercises = ['Push-ups', 'Bench Press', 'Dumbbell Fly', 'Chest Dips'];
  final List<String> _backExercises = ['Pull-ups', 'Barbell Rows', 'Lat Pulldown', 'Deadlifts'];
  final List<String> _legExercises = ['Squats', 'Leg Press', 'Lunges', 'Deadlifts'];
  final List<String> _armExercises = ['Bicep Curls', 'Tricep Extensions', 'Hammer Curls', 'Skull Crushers'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GYMIFY"),
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.white38,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Tap On the Tile to Know Exercises for MUSCLE GROUP',

          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
          ),
          Divider(
            height: 2,
            thickness: 4,
          ),
          ListTile(
            title: Center(
              child: Text('Chest',
           style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 25,
           ),
              ),
            ),
            onTap: () => _showExercises(context, _chestExercises),
          ),
          Divider(
            height: 2,
            thickness: 4,
          ),
          ListTile(
            title: Center(
              child: Text('Arms',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            onTap: () => _showExercises(context, _armExercises),
          ),
          Divider(
            height: 2,
            thickness: 4,
          ),
          ListTile(
            title: Center(
              child: Text('Back',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            onTap: () => _showExercises(context, _backExercises),
          ),
          Divider(
            height: 2,
            thickness: 4,
          ),
          ListTile(
            title: Center(
              child: Text('Legs',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            onTap: () => _showExercises(context, _legExercises),
          ),
          Divider(
            thickness: 4,
          ),

        ],
      ),
    );
  }

  void _showExercises(BuildContext context, List<String> exercises) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exercises'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: exercises
                  .map((exercise) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(exercise),
              ))
                  .toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },

    );
  }
}
