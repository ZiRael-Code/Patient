import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ConfirmLocation.dart';

class SelectYourLocation extends StatefulWidget {
  const SelectYourLocation({super.key});

  @override
  State<SelectYourLocation> createState() => _SelectYourLocationState();
}

class _SelectYourLocationState extends State<SelectYourLocation> {
  TextEditingController controller = TextEditingController();

  final List<Map<String, String>> addressMap = [
    {
      "address": "Green Street, 13",
      "city": "Lagos",
      "country": "Nigeria",
    },
    {
      "address": "Green road avenue",
      "city": "Lagos",
      "country": "Nigeria",
    },
    {
      "address": "Green Street, 13",
      "city": "Lagos",
      "country": "Nigeria",
    },
    {
    },
  ];

  String query = "";
  bool showAddPatient = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredAddresses = addressMap
        .where((map) => map.values.any(
          (value) => value.toLowerCase().contains(query.toLowerCase()),
    ))
        .toList();
    filteredAddresses.add(addressMap.last);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xFFE5E5E5),
              ),
              child: SvgPicture.asset(
                'assets/images/back.svg',
                width: 8.0,
                height: 15,
              ),
            ),
            const Spacer(),
            const Text(
              'Select your location',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
            ),
            const Spacer(),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    query = value;
                    showAddPatient = !filteredAddresses.isEmpty;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search by street name, city...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: filteredAddresses.isNotEmpty,
              child: Expanded(
                child: ListView.builder(
                  itemCount: filteredAddresses.length + 1, // Extra item for the additional row
                  itemBuilder: (context, index) {
                    if (index == filteredAddresses.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Can’t find your address?",
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 10),
                                Text("Use the map instead"),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Color(0xffE2EDFF),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    final address = filteredAddresses[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:
                            (builder) => ConfirmLocation()));
                      },
                      child: addressWidget(
                        address["address"] ?? "No Address",
                        address["city"],
                        address["country"],
                      ),
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: query.isEmpty,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(color: Color(0xffE2EDFF),
                    shape: BoxShape.circle
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "Use my location",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addressWidget(String name, String? city, String? country) {
    return ListTile(
      title: Text(name),
      subtitle: Text(
        "$city, $country",
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: SelectYourLocation()));
}
