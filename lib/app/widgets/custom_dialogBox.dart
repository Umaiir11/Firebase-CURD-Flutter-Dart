import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController locationController;
  final VoidCallback onPressed;

  const CustomDialogBox({
    required this.nameController,
    required this.ageController,
    required this.locationController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter User Information'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                hintText: 'Enter Age',
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: 'Enter Location',
                labelText: 'Location',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          child: Text('Update'),
        ),
      ],
    );
  }
}
