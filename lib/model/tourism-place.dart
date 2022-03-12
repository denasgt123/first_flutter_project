class TourismPlace {
  String name;
  String location;
  String imageAsset;

  TourismPlace({
    required this.name,
    required this.location,
    required this.imageAsset,
  });
}

var tourismPlaceList = [
  TourismPlace(
    name: 'Surabaya Submarine Monument',
    location: 'Jl. Pemuda',
    imageAsset: 'assets/images/brodin.jpg',
  ),
  TourismPlace(
    name: 'Surabaya Submarine Monument 1',
    location: 'Jl. Pemuda 1',
    imageAsset: 'assets/images/brodin.jpg',
  ),
  TourismPlace(
    name: 'Surabaya Submarine Monument 2',
    location: 'Jl. Pemuda 2',
    imageAsset: 'assets/images/brodin.jpg',
  ),
];
