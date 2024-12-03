import 'package:flutter/material.dart';

class Monty extends StatefulWidget {
  @override
  _MontyState createState() => _MontyState();
}

class _MontyState extends State<Monty> {
  DateTime _selectedYear = DateTime.now();
  String _selectedMonth = "";

  final List<String> _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Year and Month'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Year Selector (with left and right arrow buttons)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: () {
                  setState(() {
                    _selectedYear = DateTime(_selectedYear.year - 1);
                  });
                },
              ),
              Text(
                '${_selectedYear.year}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  setState(() {
                    _selectedYear = DateTime(_selectedYear.year + 1);
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),

          // Month Selector (Grid of months)
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Display 3 months per row
                childAspectRatio: 2 / 1, // Adjust for good sizing
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _months.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedMonth = _months[index];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedMonth == _months[index]
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        _months[index],
                        style: TextStyle(
                          color: _selectedMonth == _months[index]
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Done Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_selectedMonth.isNotEmpty) {
                  // Handle the month and year selection
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Selected: ${_selectedYear.year}, $_selectedMonth',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select a month'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full width button
              ),
              child: Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Monty()));
}
