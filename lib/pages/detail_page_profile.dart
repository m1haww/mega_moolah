import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetailPageProfile extends StatefulWidget {
  final String nickname;
  final String age;
  final String email;
  final XFile? avatar;

  const DetailPageProfile({
    super.key,
    required this.nickname,
    required this.age,
    required this.email,
    this.avatar,
  });

  @override
  _DetailPageProfileState createState() => _DetailPageProfileState();
}

class _DetailPageProfileState extends State<DetailPageProfile> {
  late String nickname;
  late String age;
  late String email;
  late XFile? avatar;

  @override
  void initState() {
    super.initState();
    nickname = widget.nickname;
    age = widget.age;
    email = widget.email;
    avatar = widget.avatar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Profile Details"),
        actions: [
          GestureDetector(
            onTap: () async {
              final updatedData = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(
                    nickname: nickname,
                    age: age,
                    email: email,
                    avatar: avatar,
                  ),
                ),
              );

              if (updatedData != null) {
                setState(() {
                  nickname = updatedData['nickname'];
                  age = updatedData['age'];
                  email = updatedData['email'];
                  avatar = updatedData['avatar'];
                });
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text("Edit"),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: avatar != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(File(avatar!.path)),
                      )
                    : const CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xffE48F45),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Color(0xff994D1C),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffF5CCA0),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nickname: $nickname",
                      style: const TextStyle(height: 1.5),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Age: $age",
                      style: const TextStyle(height: 1.5),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Email: $email",
                      style: const TextStyle(height: 1.5),
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

class EditProfilePage extends StatefulWidget {
  final String nickname;
  final String age;
  final String email;
  final XFile? avatar;

  const EditProfilePage({
    super.key,
    required this.nickname,
    required this.age,
    required this.email,
    this.avatar,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nicknameController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  XFile? newAvatar;

  @override
  void initState() {
    super.initState();
    nicknameController = TextEditingController(text: widget.nickname);
    ageController = TextEditingController(text: widget.age);
    emailController = TextEditingController(text: widget.email);
    newAvatar = widget.avatar;
  }

  @override
  void dispose() {
    nicknameController.dispose();
    ageController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        newAvatar = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: newAvatar != null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(File(newAvatar!.path)),
                    )
                  : const CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xffE48F45),
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Color(0xff994D1C),
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nicknameController,
              decoration: const InputDecoration(labelText: "Nickname"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: "Age"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'nickname': nicknameController.text,
                  'age': ageController.text,
                  'email': emailController.text,
                  'avatar': newAvatar,
                });
              },
              child: const Text(
                "Save Changes",
                style:
                    TextStyle(fontFamily: "Bellfair", color: Color(0xffE48F45)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
