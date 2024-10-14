import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_tracking/screens/routes_screen.dart';
import '../controllers/attendance_controller.dart';
import '../models/attendance_model.dart';
import 'location_screen.dart';


class AttendanceListScreen extends StatelessWidget {
  final AttendanceController attendanceController = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              padding: EdgeInsets.fromLTRB(16.0, 50,10,20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/10.jpg'), // Dummy Profile Image
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ravi Shastri',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'ShastriRavi@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+1234567890'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (attendanceController.members.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: attendanceController.members.length,
            itemBuilder: (context, index) {
              var member = attendanceController.members[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(member.photoUrl),
                    ),
                  ),
                  title: Text(member.name, style: TextStyle(fontSize: 20)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.share_location, size: 35),
                        onPressed: () {
                          Get.to(() => LocationScreen(member: member));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.route, size: 35),
                        onPressed: () {
                          Get.to(() => RouteDetailsScreen(member: member));
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}