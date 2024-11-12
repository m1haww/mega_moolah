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
        'The African lion, known as the "King of the Jungle," is one of the most iconic predators in the African savanna. Lions live in social groups called prides, which consist of several females, their offspring, and a few dominant males. These majestic animals play a crucial role in maintaining the balance of ecosystems by controlling herbivore populations.',
    photoUrl: 'images/lion.jpeg',
  ),
  HomeInfo(
    title: 'Asian Elephant',
    description:
        'The Asian elephant, revered in many cultures for its strength and wisdom, is one of the largest land mammals. These gentle giants are known for their impressive intelligence, long lifespans, and deep family bonds. They are often found in forests and grasslands across Asia, where they play a key role in dispersing seeds and maintaining the health of their habitats.',
    photoUrl: 'images/asian-elephat.jpg',
  ),
  HomeInfo(
    title: 'Common Dolphin',
    description:
        'The common dolphin is one of the most intelligent and sociable marine animals. Known for its playful behavior, it often swims alongside boats and interacts with humans. These dolphins live in large pods, communicate using a variety of clicks and whistles, and are essential to marine ecosystems as apex predators.',
    photoUrl: 'images/3B0E5A88-E556-FDFE-9AE0EFD757715600.jpg',
  ),
  HomeInfo(
    title: 'Bengal Tiger',
    description:
        'The Bengal tiger, a powerful and solitary predator, is recognized for its vibrant orange coat adorned with black stripes. Found primarily in the dense forests and grasslands of India, these tigers are skilled hunters, relying on stealth and strength to catch their prey. Bengal tigers are a symbol of strength and are vital to maintaining biodiversity in their ecosystems.',
    photoUrl: 'images/blake-meyer-5RBXc7R-YWs-unsplash-scaled.jpg',
  ),
  HomeInfo(
    title: 'Polar Bear',
    description:
        'The polar bear, an apex predator of the Arctic, is perfectly adapted to survive in one of the planet\'s harshest environments. With thick fur, a layer of fat for insulation, and powerful swimming abilities, polar bears hunt seals on the ice. They are considered a keystone species, highlighting the importance of Arctic conservation efforts in combating climate change.',
    photoUrl: 'images/D146896.jpg',
  ),
];
