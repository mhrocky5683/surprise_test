// search_page.dart

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Define variables to store selected values
  String selectedOption = 'Option 1';
  int selectedNumber = 1;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Function to show time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container 1
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select an Option:',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    DropdownButton<String>(
                      value: selectedOption,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedOption = newValue;
                          });
                        }
                      },
                      items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              // Container 2
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Number:',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              selectedNumber = selectedNumber > 1 ? selectedNumber - 1 : 1;
                            });
                          },
                        ),
                        Text(
                          '$selectedNumber',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              selectedNumber++;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Select Date:',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Pick a Date'),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Selected Date: ${selectedDate.toLocal()}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Select Time:',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () => _selectTime(context),
                      child: Text('Pick a Time'),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Selected Time: ${selectedTime.format(context)}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
