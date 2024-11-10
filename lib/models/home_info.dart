class HomeInfo {
  final String title;
  final String description;
  final String photoUrl;

  HomeInfo({
    required this.title,
    required this.description,
    required this.photoUrl,
  });
}

final List<HomeInfo> animalArticles = [
  HomeInfo(
    title: 'African Lion',
    description:
        'The lion is one of the largest predators in the African savanna.',
    photoUrl: 'images/lion.jpeg',
  ),
  HomeInfo(
    title: 'Asian Elephant',
    description:
        'The Asian elephant is known for its impressive intelligence and memory.',
    photoUrl: 'images/asian-elephat.jpg',
  ),
  HomeInfo(
    title: 'Common Dolphin',
    description: 'The common dolphin is one of the friendliest marine animals.',
    photoUrl: 'images/3B0E5A88-E556-FDFE-9AE0EFD757715600.jpg',
  ),
  HomeInfo(
    title: 'Bengal Tiger',
    description:
        'The Bengal tiger is famous for its orange fur with black stripes.',
    photoUrl: 'images/blake-meyer-5RBXc7R-YWs-unsplash-scaled.jpg',
  ),
  HomeInfo(
    title: 'Polar Bear',
    description:
        'The polar bear is perfectly adapted to life in Arctic regions.',
    photoUrl: 'images/D146896.jpg',
  ),
];
