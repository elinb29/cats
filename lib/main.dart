import 'package:flutter/material.dart';

import 'cats.dart';
import 'cats_detail.dart';

void main() {
  runApp(const CatsApp());
}

class CatsApp extends StatelessWidget {
  const CatsApp({Key? key}) : super(key: key);

  // 1
  @override
  Widget build(BuildContext context) {
    // 2
    final ThemeData theme = ThemeData();
    // 3
    return MaterialApp(
      // 4
      title: 'Породы кошек',
      // 5
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blueGrey,
        ),
      ),
      // 6
      home: const MyHomePage(title: 'Породы кошек'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      // 2
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 3
      body: SafeArea(
        // 4
        // 4
        child: ListView.builder(
          // 5
          itemCount: Cats.samples.length,
          // 6
          itemBuilder: (BuildContext context, int index) {
            // 7
            return GestureDetector(
              // 8
              onTap: () {
                // 9
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 10
                      return CatsDetail(cats: Cats.samples[index]);
                    },
                  ),
                );
              },
              // 11
              child: buildCatsCard(Cats.samples[index]),
            );
          },
        ),
      ),
    );
  }

  Widget buildCatsCard(Cats cats) {
    return Card(
      // 1
      elevation: 2.0,
      // 2
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 4
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(cats.imageUrl)),
            // 5
            const SizedBox(
              height: 14.0,
            ),
            // 6
            Text(
              cats.label,
              style: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
