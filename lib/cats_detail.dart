import 'package:flutter/material.dart';
import 'cats.dart';

class CatsDetail extends StatefulWidget {
  final Cats cats;

  const CatsDetail({Key? key, required this.cats}) : super(key: key);

  @override
  _CatsDetailState createState() {
    return _CatsDetailState();
  }
}

class _CatsDetailState extends State<CatsDetail> {

  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cats.label),
      ),
      // 2
      body: SafeArea(
        // 3
        child: Column(
          children: <Widget>[
            // 4
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image:
              AssetImage(widget.cats.imageUrl)),
            ),
            // 5
            const SizedBox(
              height: 4,
            ),
            // 6
            Text(
              widget.cats.label,
              style: const TextStyle(fontSize: 30),
            ),
            // 7
            Expanded(
              // 8
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.cats.descriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.cats.descriptions[index];
                  // 9
                  return Text('${ingredient.measure}', style: TextStyle(fontSize: 20),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
