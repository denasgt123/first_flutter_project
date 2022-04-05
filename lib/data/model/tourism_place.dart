class TourismResult {
  TourismResult({
    required this.status,
    required this.totalResults,
    required this.tourismPlaceList,
  });

  String status;
  int totalResults;
  List<TourismPlace> tourismPlaceList;

  factory TourismResult.fromJson(Map<String, dynamic> json) => TourismResult(
        status: json["status"],
        totalResults: json["totalResults"],
        tourismPlaceList: List<TourismPlace>.from(
            json["tourismPlaceList"].map((x) => TourismPlace.fromJson(x))),
      );
}

class TourismPlace {
  TourismPlace({
    required this.id,
    required this.name,
    required this.location,
    required this.imageAsset,
    required this.description,
    required this.dayOpen,
    required this.timeOpen,
    required this.entryPrice,
    required this.detailImages,
  });

  String id;
  String name;
  String location;
  String imageAsset;
  String description;
  String dayOpen;
  String timeOpen;
  String entryPrice;
  List<String> detailImages;

  factory TourismPlace.fromJson(Map<String, dynamic> json) => TourismPlace(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        imageAsset: json["image"],
        description: json["description"],
        dayOpen: json["day_open"],
        timeOpen: json["time_open"],
        entryPrice: json["entry_price"],
        detailImages: List<String>.from(json["detail_images"].map((x) => x)),
      );
}
