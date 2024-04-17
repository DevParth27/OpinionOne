// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildSocialButton({
  required String iconPath,
  required String text,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Card(
      color: const Color.fromARGB(255, 68, 66, 66),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 50, 49, 49),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 60,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 7),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
