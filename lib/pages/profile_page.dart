import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mega_moolah/pages/detail_page_profile.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<TextEditingController> _controller =
      List.generate(3, (index) => TextEditingController());
  final List<String> _name = ["Nickname", "Age", "Email"];

  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedImage;
    });
  }

  Widget buildTextfield(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffF5CCA0),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 71, 65, 65).withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller[index],
              decoration: InputDecoration(
                  labelText: _name[index],
                  border: InputBorder.none,
                  fillColor: const Color(0xffE48F45)),
              readOnly: false,
              keyboardType:
                  index == 3 ? TextInputType.number : TextInputType.text,
            ),
          ),
          Text(
            _name[index],
            style: const TextStyle(
              color: Color.fromARGB(255, 241, 200, 155),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E1A4),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 195, 131),
        centerTitle: true,
        title: const Text("Profile"),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text("Save"),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPageProfile(
                    nickname: _controller[0].text,
                    age: _controller[1].text,
                    email: _controller[2].text,
                    avatar: _image,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xffE48F45),
                    backgroundImage:
                        _image != null ? FileImage(File(_image!.path)) : null,
                    child: _image == null
                        ? const Icon(
                            Icons.person,
                            size: 50,
                            color: Color(0xff994D1C),
                          )
                        : null,
                  )),
              const SizedBox(
                height: 10,
              ),
              ...List.generate(3, (index) => buildTextfield(index)),
            ],
          ),
        ),
      ),
    );
  }
}
