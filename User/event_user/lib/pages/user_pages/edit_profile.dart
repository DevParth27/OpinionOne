// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:event_user/pages/userPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  late SharedPreferences _prefs;

  // Controllers for text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstNameController.text = _prefs.getString('firstName') ?? '';
      _lastNameController.text = _prefs.getString('lastName') ?? '';
      _codeController.text = _prefs.getString('code') ?? '';
      _mobileNumberController.text = _prefs.getString('mobileNumber') ?? '';
      _emailController.text = _prefs.getString('email') ?? '';
      _addressController.text = _prefs.getString('address') ?? '';
      _cityController.text = _prefs.getString('city') ?? '';
      _countryController.text = _prefs.getString('country') ?? '';
      _pincodeController.text = _prefs.getString('pincode') ?? '';
      final imagePath = _prefs.getString('imagePath');
      if (imagePath != null) {
        _image = XFile(imagePath);
      }
    });
  }

  Future<void> _saveProfileData() async {
    await _prefs.setString('firstName', _firstNameController.text);
    await _prefs.setString('lastName', _lastNameController.text);
    await _prefs.setString('code', _codeController.text);
    await _prefs.setString('mobileNumber', _mobileNumberController.text);
    await _prefs.setString('email', _emailController.text);
    await _prefs.setString('address', _addressController.text);
    await _prefs.setString('city', _cityController.text);
    await _prefs.setString('country', _countryController.text);
    await _prefs.setString('pincode', _pincodeController.text);
    if (_image != null) {
      await _prefs.setString('imagePath', _image!.path);
    }
  }

  Future<void> _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

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
              Center(
                child: GestureDetector(
                  onTap: () => _getImage(),
                  child: ClipOval(
                    child: Container(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.4,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 36, 36, 36),
                      ),
                      child: _image == null
                          ? const Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.grey,
                            )
                          : Image.file(
                              File(_image!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
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
                    child: _buildTextField(_firstNameController, 'First Name'),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: _buildTextField(_lastNameController, 'Last Name'),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: _buildTextField(
                      _codeController,
                      '+91',
                      TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: _buildTextField(
                      _mobileNumberController,
                      'Mobile Number',
                      TextInputType.number,
                    ),
                  ),
                ],
              ),
              _buildTextField(_emailController, 'Email'),
              const SizedBox(height: 20.0),
              Text(
                'Address Information',
                style: TextStyle(fontSize: 18.0, color: Colors.grey[400]),
              ),
              _buildTextField(_addressController, 'Address'),
              _buildTextField(_cityController, 'City'),
              _buildTextField(_countryController, 'Country'),
              _buildTextField(_pincodeController, 'Pincode'),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () async {
                  await _saveProfileData();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Profile data saved successfully!'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserPage()),
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
    TextEditingController controller,
    String labelText, [
    TextInputType keyboardType = TextInputType.text,
  ]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey[200]),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
