import 'package:flutter/material.dart';

class QuestionsInfo {
  final String title;
  final String description;
  final String photoUrl;

  QuestionsInfo({
    required this.title,
    required this.description,
    required this.photoUrl,
  });
}

final List<QuestionsInfo> questions = [
  QuestionsInfo(
    title: 'Which animal is known as the King of the Jungle?',
    description:
        'The lion is known as the king of the jungle. It is one of the most powerful animals in the wild.',
    photoUrl: 'images/lion.jpeg',
  ),
  QuestionsInfo(
    title: 'Which animal has a trunk?',
    description:
        'Elephants are the largest land animals and are known for their long trunks.',
    photoUrl: 'images/asian-elephant.jpg',
  ),
  QuestionsInfo(
    title: 'Which animal is known for its black and orange stripes?',
    description:
        'Tigers are famous for their distinctive black and orange stripes.',
    photoUrl: 'images/blake-meyer-5RBXc7R-YWs-unsplash-scaled.jpg',
  ),
  QuestionsInfo(
    title:
        'Which animal is known for its large size and white fur in polar regions?',
    description:
        'Polar bears are large mammals found in Arctic regions, known for their thick white fur.',
    photoUrl: 'images/D146896.jpg',
  ),
  QuestionsInfo(
    title: 'Which animal is known for its intelligence and ability to swim?',
    description:
        'Dolphins are intelligent marine animals known for their friendly nature and agility in water.',
    photoUrl: 'images/3B0E5A88-E556-FDFE-9AE0EFD757715600.jpg',
  ),
];

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _score = 0;
  int _currentQuestionIndex = 0;

  void _shuffleQuestions() {
    setState(() {
      questions.shuffle();
      _currentQuestionIndex = 0;
    });
  }

  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == questions[_currentQuestionIndex].title) {
      setState(() {
        _score += 10;
      });
    }
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
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
      appBar: AppBar(
        title: const Text('Guess the Animal'),
        centerTitle: true,
        backgroundColor: Colors.white,
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
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        List<String> answers = [
                          questions[_currentQuestionIndex].title,
                          'Lion',
                          'Elephant',
                          'Tiger',
                          'Polar Bear',
                          'Dolphin'
                        ]..shuffle();

                        return GestureDetector(
                          onTap: () => _checkAnswer(answers[index]),
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
                                    questions[_currentQuestionIndex].photoUrl,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  answers[index],
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
