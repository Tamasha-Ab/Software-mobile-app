import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'doctor_details_page.dart';

class MakeAppointmentPage extends StatefulWidget {
  final String patientId; 
  const MakeAppointmentPage({super.key, required this.patientId});

  @override
  State<MakeAppointmentPage> createState() => _MakeAppointmentPageState();
}

class _MakeAppointmentPageState extends State<MakeAppointmentPage> {
  late Future<List<Map<String, dynamic>>> _doctors;
  List<Map<String, dynamic>> _filteredDoctors = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _doctors = fetchDoctors();
  }

  Future<List<Map<String, dynamic>>> fetchDoctors() async {
    const String apiUrl = 'http://localhost:3000/api/doctor'; // Replace with your API URL
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _filteredDoctors = data.cast<Map<String, dynamic>>();
        });
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }

  void _filterDoctors(String query) {
    setState(() {
      _filteredDoctors = _filteredDoctors
          .where((doctor) => doctor['specialization']
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<Map<String, dynamic>> fetchDoctorDetails(String doctorId) async {
    final String apiUrl = 'http://localhost:3000/api/doctor/$doctorId'; // Replace with your API URL
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load doctor details');
      }
    } catch (e) {
      throw Exception('Error fetching doctor details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make an Appointment'),
        backgroundColor: const Color.fromARGB(255, 99, 181, 249),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 186, 205, 226), Color(0xFF67C8FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterDoctors,
                decoration: const InputDecoration(
                  labelText: 'Search by specialization',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _doctors,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, color: Colors.red, size: 60),
                          const SizedBox(height: 16),
                          Text(
                            'Error: ${snapshot.error}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No doctors found.',
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  } else {
                    final doctors = snapshot.data!;
                    return ListView.builder(
                      itemCount: _filteredDoctors.isEmpty
                          ? doctors.length
                          : _filteredDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = _filteredDoctors.isEmpty
                            ? doctors[index]
                            : _filteredDoctors[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person, size: 40, color: Colors.blueAccent),
                            ),
                            title: Text(
                              doctor['fullName'] ?? 'Unknown',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(doctor['specialization'] ?? 'Not specified'),
                            trailing: ElevatedButton(
                              onPressed: () async {
                                final doctorDetails = await fetchDoctorDetails(doctor['_id']);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoctorDetailsPage(
                                      doctorDetails: doctorDetails,
                                      patientId: widget.patientId,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 99, 181, 249),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              child: const Text('Check'),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
