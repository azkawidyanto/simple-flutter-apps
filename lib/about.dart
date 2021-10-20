import 'package:flutter/material.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() {
//   // debugPaintSizeEnabled = true;
//   runApp(const AboutApp());
// }

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(40),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: const Text(
                    'Muhammad Azka Widyanto',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Frontend Engineer Payfazz Neu Team',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Muhammad Azka Widyanto, or you can call me Azka.'
        'I am living in Cimanggis, Depok. I love to play football'
        'and my favrite team is real madrid',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'About page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('About Page'),
        ),
        body: ListView(
          // crossAxisCount: 1,
          children: [
            Image.asset(
              'assets/azka.jpg',
              width: 600,
              height: 350,
              fit: BoxFit.fitWidth,
            ),
            titleSection,
            // buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
