import 'package:flutter/material.dart';

class PredictionCard extends StatelessWidget {
  final String title;
  final String description;
  final String endDate;
  final String participants;
  final String price;

  const PredictionCard({
    super.key,
    required this.title,
    required this.description,
    required this.endDate,
    required this.participants,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 145, 145, 145), width: 1),
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFD8C9AE), // Deep Purple
            Color(0xFF575757), // Rich Plum
          ],
        ), // Black background
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White for the title
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(
                  255, 0, 0, 0), // Light grey for the description
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today,
                      size: 16, color: Color.fromARGB(255, 0, 0, 0)),
                  const SizedBox(width: 4),
                  Text(
                    'Ends: $endDate',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(
                          255, 0, 0, 0), // Light grey for the date
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.person,
                      size: 16, color: Color.fromARGB(255, 0, 0, 0)),
                  const SizedBox(width: 4),
                  Text(
                    participants,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(
                          255, 0, 0, 0), // Light grey for the participants
                    ),
                  ),
                ],
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54, // Blue for the price
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
