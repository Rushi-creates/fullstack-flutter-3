import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({
    Key? key,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 15),
        child: SizedBox(
          // width: MyComponents.screenSize(context).width * 0.25,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 1,
              //     blurRadius: 2,
              //     offset: Offset(0, 1),
              //   ),
              // ],
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 238, 238, 238),
                  // Color.fromARGB(255, 36, 204, 255),
                  // Color(0xFF00C6FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 12,
                    color: Colors.grey,
                  ),
                  Text('  '),
                  Text(
                    "${_selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
