import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DoctorDetailsPage extends StatefulWidget {
  @override
  _DoctorDetailsPageState createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  List<dynamic> doctors = [];
  List<dynamic> filteredDoctors = [];
  bool isLoading = true;
  String errorMessage = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    final String apiUrl = "http://localhost:3000/api/doctor"; // Use your PC’s IP

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        setState(() {
          doctors = jsonDecode(response.body);
          filteredDoctors = doctors; // Initially, show all doctors
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Failed to load doctor details.";
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = "Error: $error";
        isLoading = false;
      });
      print('Error fetching doctor details: $error');
    }
  }

  void filterDoctors(String query) {
    setState(() {
      filteredDoctors = doctors.where((doctor) {
        final specialization = doctor['specialization']?.toLowerCase() ?? '';
        return specialization.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Details'), backgroundColor: Colors.blue),
      body: Container(
        color: Colors.lightBlue.shade50, // Set background color to light blue
        child: isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.blueAccent))
            : errorMessage.isNotEmpty
                ? Center(child: Text(errorMessage, style: TextStyle(color: Colors.red, fontSize: 16)))
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: searchController,
                          onChanged: filterDoctors,
                          decoration: InputDecoration(
                            labelText: "Search by Specialization",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: filteredDoctors.length,
                          itemBuilder: (context, index) {
                            final doctor = filteredDoctors[index];

                            return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.only(bottom: 10),
                              child: ListTile(
                                leading: Icon(Icons.person, color: const Color.fromARGB(255, 20, 119, 200)),
                                title: Text("${doctor['fullName']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Phone: ${doctor['phoneNumber'] ?? 'N/A'}"),
                                    Text("Specialization: ${doctor['specialization'] ?? 'N/A'}"),
                                    Text("Experience: ${doctor['yearsOfExperience'] ?? 'N/A'} years"),
                                    Text("Doctor Fee: LKR ${doctor['doctorFee'] ?? 'N/A'}"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
