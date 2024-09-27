import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';

class Profile_data extends StatefulWidget {
  @override
  _Profile_dataState createState() => _Profile_dataState();
}

class _Profile_dataState extends State<Profile_data> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'Kasun');
  final _emailController = TextEditingController(text: 'Kasun2@gmail.com');
  final _phoneNumberController = TextEditingController(text: '0778695283');
  final _passwordController = TextEditingController(text: 'evFTbyVVCd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: maincolor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40.0),
              const CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage(
                    'assets/images/pexels-justin-shaifer-501272-1222271.jpg'), // Replace with actual asset path
              ),
              const SizedBox(height: 10.0),
              const Text('Change Picture'),
              const SizedBox(height: 60.0),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email I\'d',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30.0),
              GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Process data
                      print('Username: ${_usernameController.text}');
                      print('Email: ${_emailController.text}');
                      print('Phone Number: ${_phoneNumberController.text}');
                      print('Password: ${_passwordController.text}');
                    }
                  },
                  child:
                      const Custom_button(Bgcolor: maincolor, title: "UPDATE"))
            ],
          ),
        ),
      ),
    );
  }
}
