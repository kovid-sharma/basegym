import 'package:basegym/exercise.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'bmicalc.dart';
import 'caloriecalc.dart';
import 'nextScreen.dart';

void main() {
  runApp(const MyApp());
}
class ImageSlider extends StatelessWidget {
  final List<String> imageUrls;

  ImageSlider({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 500.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 500),
        viewportFraction: 0.8,
      ),
      items: imageUrls.map((urlitem) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  urlitem,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.black;
    final primarySwatch = MaterialColor(primaryColor.value, {
      50: primaryColor.withOpacity(0.1),
      100: primaryColor.withOpacity(0.2),
      200: primaryColor.withOpacity(0.3),
      300: primaryColor.withOpacity(0.4),
      400: primaryColor.withOpacity(0.5),
      500: primaryColor.withOpacity(0.6),
      600: primaryColor.withOpacity(0.7),
      700: primaryColor.withOpacity(0.8),
      800: primaryColor.withOpacity(0.9),
      900: primaryColor.withOpacity(1.0),
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      home: const MyHomePage(title: 'GYMIFY'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});




  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.white38,

        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 9000,
              color: Colors.black,
              child: Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Column(

                  children: <Widget>[
                    SizedBox(height: 20,),
                    ImageSlider(
                      imageUrls: [
                        'images/samuel-girven-VJ2s0c20qCo-unsplash.jpg',
                        'images/victor-freitas-hOuJYX2K5DA-unsplash.jpg',
                        'images/victor-freitas-WvDYdXDzkhs-unsplash.jpg',
                        'images/anastase-maragos-9dzWZQWZMdE-unsplash.jpg'
                      ],
                    ),
                    SizedBox(height: 40,),

                    Text('We Are Here to Help you get your',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('DREAM BODY!',

                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 1,

                                primary: Colors.black,
                                side: BorderSide(color: Colors.white, width: 2.0),
                              ),
                              onPressed: () {
                                // add your button logic here
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => bmicalc())
                                );
                              },
                              child: Text('BMI Calculator'),
                            ),



                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 1,

                                primary: Colors.black,
                                side: BorderSide(color: Colors.white, width: 2.0),
                              ),
                              onPressed: () {
                                // add your button logic here
                                Navigator.push(
                                              context,
                                    MaterialPageRoute(builder: (context) => NextScreen())
                                );
                              },
                              child: Text('Calorie Tracker'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 1,

                                primary: Colors.black,
                                side: BorderSide(color: Colors.white, width: 2.0),
                              ),
                              onPressed: () {
                                // add your button logic here
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => exercise())
                                );
                              },
                              child: Text('Know Your Exercise'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 1,

                                primary: Colors.black,
                                side: BorderSide(color: Colors.white, width: 2.0),
                              ),
                              onPressed: () {
                                // add your button logic here
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => calcalc())
                                );
                              },
                              child: Text('GYM Motivation'),
                            ),
                          ],
                        )
                      ],
                    ),



                    SizedBox(height: 40,),


                    Text(
                      'College Project',
                      style: TextStyle(
                        color: Colors.white38,
                      ),
                    )

                  ],
                ),
              ),
            ),
          ],
        )

      ),

      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Text('We are Online!',
      //
      //     style: TextStyle(
      //       fontSize: 15,
      //       fontStyle: FontStyle.italic,
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold
      //     ),),
      //     IconButton(
      //
      //       iconSize: 40,
      //       onPressed: ()
      //       {
      //         // Navigate to the new screen
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => NextScreen()),
      //         );
      //
      //       },
      //         tooltip: 'We are Online,Contact',
      //       icon:
      //           Icon(
      //             Icons.question_answer_outlined,
      //             color: Colors.white,
      //           ),
      //
      //       ),
      //   ],
      // )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
