import 'package:flutter/material.dart';

Widget buildTextField(String labelText, bool obscureText, Icon icon,
    TextEditingController controller, Function(bool)? toggleObscure) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 30, 30, 30), // Set the background color here
        borderRadius: BorderRadius.circular(11),
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixIconColor: Colors.white,
          suffixIcon: obscureText && toggleObscure != null
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    toggleObscure(!obscureText); // Invert the value
                  },
                )
              : null,
          border: InputBorder.none, // Remove the border
          labelText: labelText,
          prefixIcon: icon,
          prefixIconColor: Colors.white,
          labelStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),
    ),
  );
}

Widget buildSizedBox(double height) {
  return SizedBox(height: height);
}
