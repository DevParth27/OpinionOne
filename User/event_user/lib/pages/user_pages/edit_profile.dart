import 'dart:io';
import 'package:event_user/pages/userPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  XFile? _image;

  void _getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserPage()),
                      );
                    },
                    child: Icon((Icons.arrow_back_ios_new_rounded),
                        color: Colors.grey[300]),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                'Edit your profile details',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: 20,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 36, 36, 36),
                ),
                child: IconButton(
                  onPressed: () => _getImage(),
                  icon: _image == null
                      ? const Icon(
                          Icons.person,
                          size: 80,
                        ) // You can replace `Icons.person` with your desired person icon
                      : Image.file(File(_image!.path)),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'General Information',
                style: TextStyle(fontSize: 18.0, color: Colors.grey[400]),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('First Name'),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: _buildTextField('Last Name'),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: _buildTextField('Code'),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: _buildTextField('Mobile Number'),
                  ),
                ],
              ),
              _buildTextField('Email'),
              const SizedBox(height: 20.0),
              Text(
                'Address Information',
                style: TextStyle(fontSize: 18.0, color: Colors.grey[400]),
              ),
              _buildTextField('Address'),
              _buildTextField('City'),
              _buildTextField('Country'),
              _buildTextField('Pincode'),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfilePage()),
                  );
                },
                child: Container(
                  width: 250,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Save Changes',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        // keyboardType: keyb,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey[200]),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
