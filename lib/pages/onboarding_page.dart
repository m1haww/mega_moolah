import 'package:flutter/material.dart';
import 'package:mega_moolah/pages/navigation_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;

  final List<Widget> _pages = [
    const OnboardingContent(
      image: "images/lonely-tree-lone-tree-tree-field-wallpaper-preview.jpg",
      text:
          "Welcome to the Wild! Meet Leo, your guide through the animal kingdom!",
    ),
    const OnboardingContent(
      image: "images/namibia-africa-savanna-brown-trees-wallpaper-preview.jpg",
      text: "Discover amazing facts about wild animals and their habitats.",
    ),
    const OnboardingContent(
      image: "images/mountains-african-savanna-landscape-wallpaper-preview.jpg",
      text: "Become an animal expert with fun quizzes and badges.",
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() {
        _currentPage++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NavigationPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E1A4),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _pages[_currentPage],
            const SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: HexagonalButton(onPressed: _nextPage),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image;
  final String text;

  const OnboardingContent({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center the content
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Image.asset(image, height: 200),
        ), // Ensure the image path is correct
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "Bellefair",
              fontSize: 20,
              color: Color(0xffE48F45),
            ),
          ),
        ),
      ],
    );
  }
}

class HexagonalButton extends StatelessWidget {
  final VoidCallback onPressed;

  const HexagonalButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.all(20),
        backgroundColor: const Color(0xffE48F45),
        shadowColor: Colors.grey,
        elevation: 5,
      ),
      child: const Icon(
        Icons.arrow_forward,
        color: Color(0xff994D1C),
        size: 30,
      ),
    );
  }
}
