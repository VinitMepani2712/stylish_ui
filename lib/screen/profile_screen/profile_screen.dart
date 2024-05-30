import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(
                  context,
                )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildProfileImage(),
            SizedBox(height: 20),
            _buildSectionTitle('Personal Details'),
            SizedBox(height: 20),
            _buildTextFormField("Email Address"),
            _buildPasswordField(),
            _buildChangePasswordButton(),
            Divider(),
            SizedBox(height: 20),
            _buildSectionTitle('Business Address Details'),
            SizedBox(height: 20),
            _buildTextFormField("Pincode"),
            _buildTextFormField("Address"),
            _buildTextFormField("City"),
            _buildTextFormField("State"),
            _buildTextFormField("Country"),
            Divider(),
            SizedBox(height: 20),
            _buildSectionTitle('Bank Account Details'),
            SizedBox(height: 20),
            _buildTextFormField("Bank Account Number"),
            _buildTextFormField("Account Holder’s Name"),
            _buildTextFormField("IFSC Code"),
            SizedBox(height: 20),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                AssetImage('assets/images/main_screen_images/profile.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.edit,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTextFormField(String lable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color((0xffDEDEDE))),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color((0xffDEDEDE))),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color((0xffDEDEDE))),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color((0xffDEDEDE))),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password"),
        SizedBox(height: 10),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color((0xffDEDEDE))),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color((0xffDEDEDE))),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color((0xffDEDEDE))),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color((0xffDEDEDE))),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChangePasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Handle change password
        },
        child: Text(
          'Change Password',
          style: TextStyle(
            color: Color(0xffF83758),
            decoration: TextDecoration.underline,
            decorationColor: Color(0xffF83758),
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle save action
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffF83758),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(05),
        ),
      ),
      child: Text(
        'Save',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
