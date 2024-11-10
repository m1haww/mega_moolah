import 'package:flutter/material.dart';
import 'package:mega_moolah/models/home_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0, // Spațiere orizontală între containere
              mainAxisSpacing: 8.0, // Spațiere verticală între containere
            ),
            itemCount: animalArticles.length,
            itemBuilder: (context, index) {
              final article = animalArticles[index]; // Obține articolul curent
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF5CCA0),
                  borderRadius: BorderRadius.circular(20),
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
                      child: Image.asset(article.photoUrl),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      article.title,
                      style: const TextStyle(
                          color: Color(0xff6B240C),
                          fontSize: 16,
                          fontFamily: "Bellefair"),
                    ),
                    const SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        article.photoUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      article.title,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontFamily: "Bellefair",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      article.description,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Bellefair"),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff994D1C),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Text(
                          'Description',
                          style:
                              TextStyle(color: Color(0xffE48F45), fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
