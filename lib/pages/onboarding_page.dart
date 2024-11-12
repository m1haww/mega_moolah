import 'package:flutter/material.dart';
import 'package:mega_moolah/pages/navigation_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 1);

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
      _pageController.nextPage(
          duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
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
      backgroundColor: const Color(0xffFCEEB5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: _pages.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
            const SizedBox(height: 20),
            AnimatedSmoothIndicator(
              activeIndex: _currentPage,
              count: _pages.length,
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Color(0xffE48F45),
                dotColor: Color(0xffE7D0A3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
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
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "Bellefair",
              fontSize: 20,
              color: Color(0xff994D1C),
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}

class HexagonalButton extends StatelessWidget {
  final VoidCallback onPressed;

  const HexagonalButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        backgroundColor: const Color(0xffE48F45),
        shadowColor: Colors.black45,
        elevation: 8,
      ),
      child: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
