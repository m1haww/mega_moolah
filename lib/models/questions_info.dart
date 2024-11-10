class QuestionsInfo {
  final String questions;
  final String photoUrl;

  QuestionsInfo({
    required this.questions,
    required this.photoUrl,
  });
}

final List<QuestionsInfo> questions = [
  QuestionsInfo(
    questions: 'Which animal is known as the King of the Jungle?',
    photoUrl: 'images/lion.jpeg',
  ),
  QuestionsInfo(
    questions: 'Which animal has a trunk?',
    photoUrl: 'images/asian-elephant.jpg',
  ),
  QuestionsInfo(
    questions: 'Which animal is known for its black and orange stripes?',
    photoUrl: 'images/blake-meyer-5RBXc7R-YWs-unsplash-scaled.jpg',
  ),
  QuestionsInfo(
    questions:
        'Which animal is known for its large size and white fur in polar regions?',
    photoUrl: 'images/D146896.jpg',
  ),
  QuestionsInfo(
    questions:
        'Which animal is known for its intelligence and ability to swim?',
    photoUrl: 'images/3B0E5A88-E556-FDFE-9AE0EFD757715600.jpg',
  ),
];
