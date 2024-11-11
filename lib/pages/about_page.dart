import 'package:flutter/material.dart';

class QuestionsInfo {
  final String title;
  final String description;

  QuestionsInfo({
    required this.title,
    required this.description,
  });
}

final List<QuestionsInfo> questions = [
  QuestionsInfo(
    title: 'Which animal is known as the King of the Jungle?',
    description:
        'The lion is known as the king of the jungle. It is one of the most powerful animals in the wild.',
  ),
  QuestionsInfo(
    title: 'Which animal has a trunk?',
    description:
        'Elephants are the largest land animals and are known for their long trunks.',
  ),
  QuestionsInfo(
    title: 'Which animal is known for its black and orange stripes?',
    description:
        'Tigers are famous for their distinctive black and orange stripes.',
  ),
  QuestionsInfo(
    title:
        'Which animal is known for its large size and white fur in polar regions?',
    description:
        'Polar bears are large mammals found in Arctic regions, known for their thick white fur.',
  ),
  QuestionsInfo(
    title: 'Which animal is known for its intelligence and ability to swim?',
    description:
        'Dolphins are intelligent marine animals known for their friendly nature and agility in water.',
  ),
];

// Map of answers and corresponding image paths
final Map<String, String> answerImageMap = {
  'Lion': 'images/lion.jpeg',
  'Elephant': 'images/asian-elephat.jpg',
  'Tiger': 'images/blake-meyer-5RBXc7R-YWs-unsplash-scaled.jpg',
  'Polar Bear': 'images/D146896.jpg',
  'Dolphin': 'images/3B0E5A88-E556-FDFE-9AE0EFD757715600.jpg',
};

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _score = 0;
  int _currentQuestionIndex = 0;
  List<MapEntry<String, String>> _shuffledAnswers = [];

  @override
  void initState() {
    super.initState();
    _shuffleQuestions();
    _shuffleAnswers();
  }

  void _shuffleQuestions() {
    setState(() {
      questions.shuffle();
      _currentQuestionIndex = 0;
    });
  }

  void _shuffleAnswers() {
    setState(() {
      _shuffledAnswers = answerImageMap.entries.toList();
      _shuffledAnswers.shuffle();
    });
  }

  void _checkAnswer(String selectedAnswer) {
    // Define the correct answers based on the question titles
    final correctAnswers = {
      'Which animal is known as the King of the Jungle?': 'Lion',
      'Which animal has a trunk?': 'Elephant',
      'Which animal is known for its black and orange stripes?': 'Tiger',
      'Which animal is known for its large size and white fur in polar regions?':
          'Polar Bear',
      'Which animal is known for its intelligence and ability to swim?':
          'Dolphin',
    };

    // Retrieve the correct answer for the current question
    String correctAnswer =
        correctAnswers[questions[_currentQuestionIndex].title] ?? '';

    if (selectedAnswer == correctAnswer) {
      setState(() {
        _score += 10;
      });
    }

    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
      _shuffleAnswers(); // Reshuffle answers for each new question
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Quiz Completed'),
          content: Text('Your score is $_score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _shuffleQuestions();
                _shuffleAnswers();
                setState(() {
                  _score = 0; // Reset score for a new quiz
                });
              },
              child: const Text('Start New Quiz'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E1A4),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 195, 131),
        title: const Text('Guess the Animal'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.monetization_on, color: Colors.amber),
                onPressed: () {},
              ),
              const SizedBox(width: 8.0),
              Text(
                '$_score',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(width: 16.0),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        questions[_currentQuestionIndex].title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontFamily: "Bellefair",
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6B240C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: _shuffledAnswers.length,
                      itemBuilder: (context, index) {
                        String animal = _shuffledAnswers[index].key;
                        String imagePath = _shuffledAnswers[index].value;

                        return GestureDetector(
                          onTap: () => _checkAnswer(animal),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xffF5CCA0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  animal,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Bellefair",
                                    color: Color(0xffE48F45),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
