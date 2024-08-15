import 'package:event_user/pages/userPage.dart';
import 'package:flutter/material.dart';

class ManageEventsPage extends StatefulWidget {
  const ManageEventsPage({super.key});

  @override
  _ManageEventsPageState createState() => _ManageEventsPageState();
}

class _ManageEventsPageState extends State<ManageEventsPage> {
  final List<Map<String, dynamic>> _events = [
    {
      'title': 'Alan Walker Music',
      'date': '12 - 14 March 2024',
      'Number of people': '+73.2K',
      'location': 'Nagpur, India',
      'description': 'A Music Show'
    },
    {
      'title': 'Magical Show',
      'date': '20 - 22 Dec 2024',
      'Number of people': '+2.2K',
      'location': 'Nagpur, India',
      'description': 'A magical Show'
    },
  ];

  void _editEvent(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Text(
            'Edit Event',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: EditEventForm(
            initialEvent: _events[index],
            onSave: (updatedEvent) {
              setState(() {
                _events[index] = updatedEvent;
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  void _deleteEvent(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Text(
            'Confirm Deletion',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Are you sure you want to delete this event?',
            style: TextStyle(color: Colors.grey[400]),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _events.removeAt(index);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Event deleted successfully!')),
                );
              },
              child:
                  const Text('Yes', style: TextStyle(color: Colors.redAccent)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:
                  const Text('No', style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Manage Events',
          style:
              TextStyle(color: Colors.grey[300], fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  final event = _events[index];
                  return _buildEventCard(event, index);
                },
              ),
            ),
            const SizedBox(height: 20.0),
            _buildSaveChangesButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(Map<String, dynamic> event, int index) {
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
            Text(
              event['title'],
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              event['date'],
              style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
            ),
            const SizedBox(height: 8.0),
            Text(
              event['Number of people'],
              style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
            ),
            const SizedBox(height: 4.0),
            Text(
              event['location'],
              style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
            ),
            const SizedBox(height: 12.0),
            Text(
              event['description'],
              style: TextStyle(fontSize: 14.0, color: Colors.grey[300]),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _editEvent(index),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                  ),
                  icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                  label: const Text(
                    'Edit',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _deleteEvent(index),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                  ),
                  icon: const Icon(Icons.delete, size: 18, color: Colors.white),
                  label: const Text(
                    'Delete',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveChangesButton() {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Changes saved successfully!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        backgroundColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 6,
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
      icon: const Icon(Icons.save, size: 22),
      label: const Text('Save Changes'),
    );
  }
}

class EditEventForm extends StatefulWidget {
  final Map<String, dynamic>? initialEvent;
  final void Function(Map<String, dynamic>) onSave;

  const EditEventForm({super.key, this.initialEvent, required this.onSave});

  @override
  _EditEventFormState createState() => _EditEventFormState();
}

class _EditEventFormState extends State<EditEventForm> {
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _noController;
  late TextEditingController _locationController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.initialEvent?['title'] ?? '');
    _dateController =
        TextEditingController(text: widget.initialEvent?['date'] ?? '');
    _noController = TextEditingController(
        text: widget.initialEvent?['Number of people'] ?? '');
    _locationController =
        TextEditingController(text: widget.initialEvent?['location'] ?? '');
    _descriptionController =
        TextEditingController(text: widget.initialEvent?['description'] ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(_titleController, 'Event Title'),
            _buildTextField(_dateController, 'Date'),
            _buildTextField(_noController, 'Number of people'),
            _buildTextField(_locationController, 'Location'),
            _buildTextField(_descriptionController, 'Description'),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final updatedEvent = {
                  'title': _titleController.text,
                  'date': _dateController.text,
                  'Number of people': _noController.text,
                  'location': _locationController.text,
                  'description': _descriptionController.text,
                };
                widget.onSave(updatedEvent);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4,
                textStyle: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
