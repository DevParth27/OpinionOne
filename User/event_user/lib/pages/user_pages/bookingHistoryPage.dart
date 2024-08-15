import 'package:flutter/material.dart';

class BookingHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> bookings = [
    {
      'eventTitle': 'Alan Walker Music',
      'date': '12 - 14 March 2024',
      'location': 'Nagpur, India',
      'status': 'Confirmed',
      'ticketNumber': 'TK123456',
      'numberOfPeople': '+73.2K',
      'type': 'Creater', // Added type
    },
    {
      'eventTitle': 'Music Festival',
      'date': 'August 15, 2024',
      'location': 'Nagpur, India',
      'status': 'Pending',
      'ticketNumber': 'TK789012',
      'numberOfPeople': 2,
      'type': 'User', // Added type
    },
    {
      'eventTitle': 'Dance Performance',
      'date': 'October 5, 2024',
      'location': 'Nagpur, India',
      'status': 'Cancelled',
      'ticketNumber': 'TK345678',
      'numberOfPeople': '+1.2K',
      'type': 'Creater', // Added type
    },
  ];

  BookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Booking History',
          style: TextStyle(
            color: Colors.grey[300],
            fontWeight: FontWeight.w600,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return _buildBookingCard(booking);
          },
        ),
      ),
    );
  }

  Widget _buildBookingCard(Map<String, dynamic> booking) {
    return Card(
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booking['eventTitle'],
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                _buildStatusChip(booking['status']),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              booking['date'],
              style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
            ),
            const SizedBox(height: 4.0),
            Text(
              booking['location'],
              style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ticket No: ${booking['ticketNumber']}',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[300]),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Number of People: ${booking['numberOfPeople']}',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[300]),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Type: ${booking['type']}', // Displaying the type
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[300]),
                    ),
                  ],
                ),
                _buildActionButtons(booking['status']),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'Confirmed':
        color = const Color.fromARGB(255, 100, 169, 136);
        break;
      case 'Pending':
        color = const Color.fromARGB(255, 191, 139, 72);
        break;
      case 'Cancelled':
        color = Colors.redAccent;
        break;
      default:
        color = Colors.grey;
    }
    return Chip(
      label: Text(
        status,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: color,
    );
  }

  Widget _buildActionButtons(String status) {
    if (status == 'Cancelled') {
      return Container(); // No actions for cancelled bookings
    }

    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 4,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
          ),
          child: const Text('View',
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 4,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
          ),
          child: const Text('Cancel',
              style: TextStyle(fontSize: 14.0, color: Colors.white)),
        ),
      ],
    );
  }
}
