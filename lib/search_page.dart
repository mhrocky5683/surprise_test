import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int passengerCount = 1; // Define passengerCount here
  // Set the default value to 'AC' or any other initial value
  String selectedFromLocation = 'Dhaka';
  String selectedToLocation = 'Uttara';
  String selectedType = 'AC';
  DateTime? selectedDate;

  void _SearchPage() {
    // For simplicity, let's check if both username and password are not empty
    if (selectedFromLocation != selectedToLocation) {
      // Navigate to the search page on successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    } else {
      // Show an error message if login fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                ],
              ),
            ),
            Container(
              width: 600,
              child: Text(
                "Hey, Mubarak!",
                style: TextStyle(
                  fontSize: 26,
                  color: const Color.fromARGB(255, 51, 243, 33),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 600,
              child: Text(
                "Bus",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 93, 243, 33)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 600,
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color.fromARGB(255, 33, 243, 103),
                                ),
                              ),
                              Text(
                                'From:',
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 110, 243, 33),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.green),
                              SizedBox(width: 10),
                              Expanded(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  hint: Text('From Location'),
                                  value: selectedFromLocation,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedFromLocation = newValue!;
                                    });
                                  },
                                  items: <String>['Dhaka', 'Uttara', 'Sherpur']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(249, 19, 255, 58),
                                          // backgroundColor: Colors.blue
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        // Row 2, Column 1

                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'To :',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 142, 238, 123)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.0),
                        // Row 2, Column 2
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: double.infinity,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.green),
                              SizedBox(width: 10),
                              Expanded(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  hint: Text('To Location'),
                                  value: selectedToLocation,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedToLocation = newValue!;
                                    });
                                  },
                                  items: <String>['Dhaka', 'Uttara', 'Sherpur']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 100, 241, 105)),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromARGB(
                                            255, 33, 243, 79),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Person :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle decrease button press
                                        setState(() {
                                          if (passengerCount > 1) {
                                            passengerCount--;
                                          }
                                        });
                                      },
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '$passengerCount',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          passengerCount++;
                                        });
                                      },
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Text(
                              'Type :',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8),
                            DropdownButton<String>(
                              value: selectedType,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedType = newValue!;
                                });
                              },
                              items: <String>['AC', 'Non-AC']
                                  .map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  Text(
                    'Time :',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      _selectDate(context); // Call function to show date picker
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        selectedDate != null
                            ? "${selectedDate!.toLocal()}".split(' ')[0]
                            : ' Date',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle search button press
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
