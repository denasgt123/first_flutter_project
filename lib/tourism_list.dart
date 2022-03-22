import 'package:first_flutter_project/detail_screen.dart';
import 'package:first_flutter_project/model/tourism-place.dart';
import 'package:first_flutter_project/list_item.dart';
import 'package:flutter/material.dart';

class TourismList extends StatefulWidget {
  final List<TourismPlace> doneTourismPlaceList;
  const TourismList({Key? key, required this.doneTourismPlaceList})
      : super(key: key);

  @override
  State<TourismList> createState() => _TourismListState(doneTourismPlaceList);
}

class _TourismListState extends State<TourismList> {
  final List<TourismPlace> doneTourismPlaceList;
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Surabaya Submarine Monument',
      location:
          'Jl. Pemuda No.39, Embong Kaliasin, Kec. Genteng, Kota SBY, Jawa Timur 60271',
      imageAsset: 'assets/images/monkasel.jpg',
      description:
          'Surabaya Submarine Monument or as known as Monumen Kapal Selam (Monkasel) is the largest submarine monument in Asia, which was built in riverside of Kalimas, Surabaya. This monument was built by idea of Navy Veterans.',
      dayOpen: 'Tuesday - Sunday',
      timeOpen: '08.00 - 16.00',
      entryPrice: 'Rp 15.000,-',
      detailImages: [
        'assets/images/monkasel1.jpg',
        'assets/images/monkasel2.jpg',
        'assets/images/monkasel3.jpg',
        'assets/images/monkasel4.jpg',
      ],
    ),
    TourismPlace(
      name: 'Sanggar Agung Temple',
      location:
          'Jl. Sukolilo No.100, Sukolilo Baru, Kec. Bulak, Kota SBY, Jawa Timur 60122',
      imageAsset: 'assets/images/sanggar-temple.jpg',
      description:
          'Sanggar Agung Temple or Hong San Tang (Chinese: 宏善堂) is a Chinese temple in Surabaya dedicated to Chinese deities and other Asian religious icons. It is located within the Pantai Ria amusement park and has become a tourist destination, even though it is originally a worship place for Tridharma followers. The name of Sanggar Agung is derived from Indonesian language which can be translated as Great Hall.',
      dayOpen: 'Open Everyday',
      timeOpen: '07.00 - 20.00',
      entryPrice: 'Rp 5.000 - 10.000',
      detailImages: [
        'assets/images/sanggar-temple1.jpg',
        'assets/images/sanggar-temple2.jpg',
        'assets/images/sanggar-temple3.jpg',
        'assets/images/sanggar-temple4.jpg',
      ],
    ),
    TourismPlace(
      name: 'Heroes Monument',
      location:
          'Jl. Pahlawan, Alun-alun Contong, Kec. Bubutan, Kota SBY, Jawa Timur 60174',
      imageAsset: 'assets/images/tugu.jpg',
      description:
          'The Heroes Monument (Indonesian: Tugu Pahlawan) is a monument in Surabaya, Indonesia. It is the main symbol of the city, dedicated to the people who died during the Battle of Surabaya on 10 November 1945. The 10 November Museum is located under the monument.',
      dayOpen: 'Open Everyday',
      timeOpen: '08.00 - 16.00',
      entryPrice: 'Rp 5.000,-',
      detailImages: [
        'assets/images/tugu1.jpg',
        'assets/images/tugu2.jpg',
        'assets/images/tugu3.jpg',
        'assets/images/tugu4.jpg',
      ],
    ),
    TourismPlace(
      name: 'House of Sampoerna',
      location:
          'Taman Sampoerna No.6, Krembangan Utara, Kec. Pabean Cantikan, Kota SBY, Jawa Timur 60163',
      imageAsset: 'assets/images/sampoerna.jpg',
      description:
          "Open to the public since October 9, 2003, House of Sampoerna (HoS) is a Dutch colonial-style heritage building complex built in 1862 and located in the “Old Surabaya” area. This complex was initially an orphanage for boys managed by the Dutch. In 1932, it was purchased by Liem Seeng Tee then became the first Sampoerna's production facility. House of Sampoerna complex consists of a large central auditorium, two smaller buildings in the East and West wings.",
      dayOpen: 'Open Everyday',
      timeOpen: '09.00 - 18.00',
      entryPrice: 'Free',
      detailImages: [
        'assets/images/sampoerna1.jpg',
        'assets/images/sampoerna2.jpg',
        'assets/images/sampoerna3.jpg',
        'assets/images/sampoerna4.jpg',
      ],
    ),
    TourismPlace(
      name: 'Suro and Boyo Statue',
      location:
          'Jl. Diponegoro No.1-B, Darmo, Kec. Wonokromo, Kota SBY, Jawa Timur 60241',
      imageAsset: 'assets/images/suroboyo.jpg',
      description:
          "This landmark sculpture in Surabaya depicts a tussle for supremacy between a shark and a crocodile and is a symbol of Surabaya's strength. The statue holds special significance for the city of Surabaya, especially in light of the fact that the city got its name from the Javanese words for shark and crocodile, 'suro' and 'boyo' respectively.",
      dayOpen: 'Open Everyday',
      timeOpen: 'Open 24 Hours',
      entryPrice: 'Free',
      detailImages: [
        'assets/images/suroboyo1.jpg',
        'assets/images/suroboyo2.jpg',
        'assets/images/suroboyo3.jpg',
        'assets/images/suroboyo4.jpg',
      ],
    ),
  ];

  _TourismListState(this.doneTourismPlaceList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: ListItem(
              place: place,
              isDone: doneTourismPlaceList.contains(place),
              onCheckboxClick: (bool? value) {
                setState(() {
                  if (value != null) {
                    value
                        ? doneTourismPlaceList.add(place)
                        : doneTourismPlaceList.remove(place);
                  }
                });
              }),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }

  // Widget ListItem(TourismPlace place) {
  //   return Card(
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Expanded(
  //           flex: 1,
  //           child: Image.asset(place.imageAsset),
  //         ),
  //         Expanded(
  //           flex: 2,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisSize: MainAxisSize.min,
  //               children: <Widget>[
  //                 Text(
  //                   place.name,
  //                   style: const TextStyle(fontSize: 16.0),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 Text(place.location),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
