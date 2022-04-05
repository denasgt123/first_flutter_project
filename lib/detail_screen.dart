import 'package:first_flutter_project/data/model/tourism_place.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.place}) : super(key: key);

  final TourismPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Icon(
        //     Icons.arrow_back,
        //   ),
        // ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(place.imageAsset),
            Container(
              // Title
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
            Container(
              // Icons
              margin: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.calendar_today),
                      Text(place.dayOpen),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.schedule),
                      Text(place.timeOpen),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.attach_money),
                      Text(place.entryPrice),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              // Description
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              // Slider Image
              height: 150,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(place.detailImages[index]),
                    ),
                  );
                },
                itemCount: place.detailImages.length,
                scrollDirection: Axis.horizontal,
                // children: [
                //   Padding(
                //     padding: const EdgeInsets.all(4.0),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(20.0),
                //       child: Image.network(place.detailImages[0]),
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(4.0),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(20.0),
                //       child: Image.network(place.detailImages[1]),
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.all(4.0),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(20.0),
                //       child: Image.network(place.detailImages[2]),
                //     ),
                //   ),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
