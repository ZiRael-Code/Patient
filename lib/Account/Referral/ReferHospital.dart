import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'SendInvites.dart';
import 'contacts_checked_tile.dart';


class ReferHospital extends StatefulWidget {
  const ReferHospital({super.key});

  @override
  State<ReferHospital> createState() => _ReferHospitalState();
}

class _ReferHospitalState extends State<ReferHospital>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final String referralCode = '7f44aiwuehjands3gui';

  List<String> contacts = [
    "Alexander Trelawney",
    "Blexander Trelawney",
    "Jonathan Mason",
    "Sophia Bennett",
    "Emily Jones",
  ];

  List<String> filteredContacts = [
    "Alexander Trelawney",
    "Blexander Trelawney",
    "Jonathan Mason",
    "Sophia Bennett",
    "Emily Jones",
  ];

  // Keep track of selected contacts
  Set<String> selectedContacts = {};

  // Filter contacts based on search query
  void _filterContacts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredContacts = contacts;
      } else {
        filteredContacts = contacts
            .where((contact) =>
                contact.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  // Add or remove a contact from the selected list
  void _toggleSelection(String contact, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedContacts.add(contact);
      } else {
        selectedContacts.remove(contact);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const SizedBox(width: 50),
                  const Center(
                    child: Text(
                      "Refer a hospital",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: selectedContacts.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          height: 60,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Container with person icon
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    width: 49,
                                    height: 49,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset("assets/images/hospital.svg",
                                        color: Colors.white),
                                  ),
                                  const SizedBox(width: 10),

                                  const Text(
                                    'Referral link:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10), // Spacing

                                  Expanded(
                                    child: Text(
                                      referralCode,
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(
                                          ClipboardData(text: referralCode));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Copied to clipboard')));
                                    },
                                    child: Container(
                                      width: 79,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE2EDFF),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.copy,
                                              color: Colors.blue, size: 16),
                                          SizedBox(width: 5),
                                          Text(
                                            'Copy',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 35),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        onChanged: _filterContacts,
                        decoration: InputDecoration(
                          hintText: "Patient name or Phone number",
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey[400]),
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.grey[400],
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Increment selected
                    Center(
                      child: Text(
                        "[ ${selectedContacts.length} selected ]", // Show the count of selected contacts
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredContacts.length,
                        itemBuilder: (context, index) {
                          final contact = filteredContacts[index];
                          return ContactsCheckedTile(
                            name: contact,
                            isInitiallySelected:
                                selectedContacts.contains(contact),
                            onSelectionChanged: (isSelected) {
                              _toggleSelection(contact, isSelected);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: selectedContacts.isNotEmpty
                    ? GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SendInvites())),
                        child: Container(
                          width: 335,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
