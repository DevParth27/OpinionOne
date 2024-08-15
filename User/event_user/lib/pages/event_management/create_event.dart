import 'package:event_user/pages/homepage.dart';
import 'package:event_user/widgets/checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 47, 45, 45),
              Color.fromARGB(199, 72, 68, 71),
              Color.fromARGB(255, 34, 28, 32),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                // AppBar with padding
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    iconTheme: const IconThemeData(color: Colors.white),
                    title: Text(
                      'Ｃｒｅａｔｅ Ｅｖｅｎｔ',
                      style: GoogleFonts.getFont('Roboto').copyWith(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                // Text fields and other inputs
                const SizedBox(height: 20),
                _eventDetails('𝚆𝚑𝚊𝚝\'𝚜 𝚝𝚑𝚎 𝙴𝚟𝚎𝚗𝚝 𝙲𝚊𝚕𝚕𝚎𝚍?',
                    'Craft Your Event Title'),
                const SizedBox(height: 2),
                _title('ᴅᴀᴛᴇ?'),
                _buildDateField(),
                _title('𝙵𝚛𝚘𝚖 𝚃𝚒𝚖𝚎'),
                _buildTimeField(),
                _title('𝚃𝚘 𝚃𝚒𝚖𝚎'),
                _buildTimeField2(),
                _eventDetailss(),
                const SizedBox(height: 10),
                Divider(
                  height: 1.5,
                  thickness: 1,
                  color: Colors.grey[400],
                  indent: 10,
                  endIndent: 10,
                ),
                _eventDetails(
                  '𝙳𝚎𝚜𝚌𝚛𝚒𝚙𝚝𝚒𝚘𝚗',
                  'Event Details',
                  maxLines: 5,
                ),
                _eventDetails('𝙻𝚘𝚌𝚊𝚝𝚒𝚘𝚗', 'Event Location'),
                const SizedBox(height: 10),
                Divider(
                  height: 1.5,
                  thickness: 1,
                  color: Colors.grey[400],
                  indent: 10,
                  endIndent: 10,
                ),
                const SizedBox(height: 11),
                _title('𝙶𝚞𝚎𝚜𝚝𝚜'),
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
                _title('𝚄𝚙𝚕𝚘𝚊𝚍 𝙱𝚊𝚗𝚗𝚎𝚛 𝙸𝚖𝚊𝚐𝚎'),
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
                const SizedBox(height: 10),
                _actionButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _guestOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '𝙶𝚞𝚎𝚜𝚝 𝙲𝚊𝚗 ?',
            style: TextStyle(color: Colors.white, fontSize: 18, height: 1.5),
          ),
        ),
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
          label: 'See other Guest List',
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

  Widget _buildTextField(
      {required String text, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          hintText: text,
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
        ),
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

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () => _selectDate(context),
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            hintStyle: const TextStyle(color: Colors.white70),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _selectedDate != null
                  ? Text(
                      '${months[_selectedDate!.month - 1]} ${_selectedDate!.day} , ${_selectedDate!.year}',
                      style: const TextStyle(color: Colors.white),
                    )
                  : const Text(
                      'Select Date',
                      style: TextStyle(color: Colors.white),
                    ),
              const Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () => _selectTime(context),
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
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
                  : const Text(
                      'Select From Time',
                      style: TextStyle(color: Colors.white),
                    ),
              const Icon(
                Icons.access_time,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: InkWell(
        onTap: () => _pickImage(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0.2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: const Row(
            children: [
              Icon(
                Icons.image,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Select Image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _eventDetailss() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
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
                  ? "ᴛʜɪꜱ ᴇᴠᴇɴᴛ ᴡɪʟʟ ᴛᴀᴋᴇ ᴘʟᴀᴄᴇ ᴏɴ ${DateFormat('MMMM dd, yyyy').format(_selectedDate!)} ꜰʀᴏᴍ ${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')} ${_selectedTime!.period.name.toUpperCase()} ᴛᴏ ${_selectedTime2!.hour}:${_selectedTime2!.minute.toString().padLeft(2, '0')} ${_selectedTime2!.period.name.toUpperCase()}"
                  : "Please select date and time",
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
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
      ),
    );
  }

  Widget _buildTimeField2() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () => _selectTime2(context),
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
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
                  : const Text(
                      'Select To Time',
                      style: TextStyle(color: Colors.white),
                    ),
              const Icon(
                Icons.access_time,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _eventDetails(String title, String hint, {int maxLines = 1}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.getFont('Roboto').copyWith(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            hintText: hint, // Use the provided hint parameter
            hintStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
        ),
      ],
    ),
  );
}

Widget _title(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
