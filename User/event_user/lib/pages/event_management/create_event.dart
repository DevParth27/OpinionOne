import 'package:event_user/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/checkbox_widget.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  TimeOfDay? _selectedTime2;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Future<void> _selectTime2(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime2) {
      setState(() {
        _selectedTime2 = pickedTime;
      });
    }
  }

  XFile? _selectedImage;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 87, 88),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: width * 0.9,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 39, 39, 39),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Create Event',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      height: 1.5,
                      thickness: 1,
                      color: Colors.grey[400],
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(height: 20),
                    _title('Title'),
                    const SizedBox(height: 10),
                    _buildTextField(
                        text: 'Event Title', keyboardType: TextInputType.text),
                    const SizedBox(height: 11),
                    _title('Date'),
                    const SizedBox(height: 10),
                    _buildDateField(),
                    const SizedBox(height: 11),
                    _title('From Time'),
                    const SizedBox(height: 10),
                    _buildTimeField(),
                    const SizedBox(height: 11),
                    _title('To Time'),
                    const SizedBox(height: 10),
                    _buildTimeField2(),
                    const SizedBox(height: 19),
                    _eventDetails(),
                    const SizedBox(height: 20),
                    Divider(
                      height: 1.5,
                      thickness: 1,
                      color: Colors.grey[400],
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(height: 5),
                    _title('Location'),
                    const SizedBox(height: 10),
                    _buildTextField(
                        text: 'Event Location',
                        keyboardType: TextInputType.text),
                    const SizedBox(height: 20),
                    Divider(
                      height: 1.5,
                      thickness: 1,
                      color: Colors.grey[400],
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(height: 11),
                    _title('Guests'),
                    const SizedBox(height: 10),
                    _buildTextField(
                        text: 'Expected Number of Guests',
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 20),
                    _guestOptions(),
                    const SizedBox(height: 20),
                    Divider(
                      height: 1.5,
                      thickness: 1,
                      color: Colors.grey[400],
                      indent: 10,
                      endIndent: 10,
                    ),
                    _title('Upload Banner Image'),
                    const SizedBox(height: 10),
                    _buildImagePicker(),
                    const SizedBox(height: 10),
                    if (_selectedImage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Selected Image: ${_selectedImage!.name}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    const SizedBox(height: 20),
                    Divider(
                      height: 1.5,
                      thickness: 1,
                      color: Colors.grey[400],
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(height: 20),
                    _actionButtons(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String text, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 27, 27, 27),
        hintText: text,
        hintStyle: TextStyle(color: Colors.grey[300]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDateField() {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 27, 27, 27),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
            borderSide: BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _selectedDate != null
                ? Text(
                    '${months[_selectedDate!.month - 1]} ${_selectedDate!.day} , ${_selectedDate!.year}',
                    style: const TextStyle(color: Colors.white),
                  )
                : Text(
                    'Select Date',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
            Icon(
              Icons.calendar_today,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeField() {
    return InkWell(
      onTap: () => _selectTime(context),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 27, 27, 27),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
            borderSide: BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _selectedTime != null
                ? Text(
                    '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}  ${_selectedTime!.period.name.toUpperCase()}',
                    style: const TextStyle(color: Colors.white),
                  )
                : Text(
                    'Select From Time',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
            Icon(
              Icons.access_time,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeField2() {
    return InkWell(
      onTap: () => _selectTime2(context),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 27, 27, 27),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
            borderSide: BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _selectedTime2 != null
                ? Text(
                    '${_selectedTime2!.hour}:${_selectedTime2!.minute.toString().padLeft(2, '0')}  ${_selectedTime2!.period.name.toUpperCase()}',
                    style: const TextStyle(color: Colors.white),
                  )
                : Text(
                    'Select To Time',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
            Icon(
              Icons.access_time,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return InkWell(
      onTap: () => _pickImage(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 27, 27, 27),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(
              Icons.image,
              color: Colors.grey[400],
              size: 24,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Select Image',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _eventDetails() {
    return Row(
      children: [
        const Icon(
          Icons.compare_arrows_rounded,
          color: Colors.green,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            _selectedDate != null &&
                    _selectedTime != null &&
                    _selectedTime2 != null
                ? "This event will take place on ${DateFormat('MMMM dd, yyyy').format(_selectedDate!)}\nFrom ${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')} ${_selectedTime!.period.name.toUpperCase()} To ${_selectedTime2!.hour}:${_selectedTime2!.minute.toString().padLeft(2, '0')} ${_selectedTime2!.period.name.toUpperCase()}"
                : "Please select date and time",
            style: TextStyle(color: Colors.grey[300]),
          ),
        ),
      ],
    );
  }

  Widget _guestOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyCheckbox(
          label: 'Modify Event',
          isChecked: _isChecked1,
          onChanged: (value) {
            setState(() {
              _isChecked1 = value!;
            });
          },
        ),
        MyCheckbox(
          label: 'Invite Others',
          isChecked: _isChecked2,
          onChanged: (value) {
            setState(() {
              _isChecked2 = value!;
            });
          },
        ),
        MyCheckbox(
          label: 'See Guest List',
          isChecked: _isChecked3,
          onChanged: (value) {
            setState(() {
              _isChecked3 = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Implement event creation logic here
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.blue,
              ),
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Create Event',
                  style: TextStyle(color: Colors.grey[300], fontSize: 16),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.red,
              ),
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.grey[300], fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
