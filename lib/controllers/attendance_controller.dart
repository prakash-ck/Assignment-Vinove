import 'dart:convert';
import 'package:get/get.dart';

import '../models/attendance_model.dart';

class AttendanceController extends GetxController {
  var members = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadMembers();
  }

  // Dummy JSON data
  void loadMembers() {
    var jsonData = '''
    {
  "members": [
    {
      "id": 1,
      "name": "Aarav Sharma",
      "photoUrl": "https://randomuser.me/api/portraits/men/1.jpg",
      "currentLocation": {"lat": 28.6139, "lng": 77.2090},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 28.6139, "lng": 77.2090, "timestamp": "10:00 AM", "duration": 10},
            {"lat": 28.6149, "lng": 77.2149, "timestamp": "10:30 AM", "duration": 15}
          ]
        }
      ]
    },
    {
      "id": 2,
      "name": "Vihaan Gupta",
      "photoUrl": "https://randomuser.me/api/portraits/men/2.jpg",
      "currentLocation": {"lat": 19.0760, "lng": 72.8777},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 19.0760, "lng": 72.8777, "timestamp": "9:00 AM", "duration": 20},
            {"lat": 19.0822, "lng": 72.7411, "timestamp": "9:45 AM", "duration": 10}
          ]
        }
      ]
    },
    {
      "id": 3,
      "name": "Vivaan Iyer",
      "photoUrl": "https://randomuser.me/api/portraits/men/3.jpg",
      "currentLocation": {"lat": 13.0827, "lng": 80.2707},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 13.0827, "lng": 80.2707, "timestamp": "11:00 AM", "duration": 30},
            {"lat": 13.0878, "lng": 80.2785, "timestamp": "11:45 AM", "duration": 20}
          ]
        }
      ]
    },
    {
      "id": 4,
      "name": "Aditya Verma",
      "photoUrl": "https://randomuser.me/api/portraits/men/4.jpg",
      "currentLocation": {"lat": 22.5726, "lng": 88.3639},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 22.5726, "lng": 88.3639, "timestamp": "8:30 AM", "duration": 15},
            {"lat": 22.5737, "lng": 88.3750, "timestamp": "9:00 AM", "duration": 25}
          ]
        }
      ]
    },
    {
      "id": 5,
      "name": "Aarohi Reddy",
      "photoUrl": "https://randomuser.me/api/portraits/women/5.jpg",
      "currentLocation": {"lat": 17.3850, "lng": 78.4867},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 17.3850, "lng": 78.4867, "timestamp": "10:15 AM", "duration": 20},
            {"lat": 17.3890, "lng": 78.4912, "timestamp": "10:45 AM", "duration": 10}
          ]
        }
      ]
    },
    {
      "id": 6,
      "name": "Ananya Singh",
      "photoUrl": "https://randomuser.me/api/portraits/women/6.jpg",
      "currentLocation": {"lat": 12.9716, "lng": 77.5946},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 12.9716, "lng": 77.5946, "timestamp": "7:30 AM", "duration": 25},
            {"lat": 12.9743, "lng": 77.6000, "timestamp": "8:00 AM", "duration": 15}
          ]
        }
      ]
    },
    {
      "id": 7,
      "name": "Riya Kapoor",
      "photoUrl": "https://randomuser.me/api/portraits/women/7.jpg",
      "currentLocation": {"lat": 26.9124, "lng": 75.7873},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 26.9124, "lng": 75.7873, "timestamp": "2:00 PM", "duration": 20},
            {"lat": 26.9150, "lng": 75.7905, "timestamp": "2:45 PM", "duration": 30}
          ]
        }
      ]
    },
    {
      "id": 8,
      "name": "Rahul Mehta",
      "photoUrl": "https://randomuser.me/api/portraits/men/8.jpg",
      "currentLocation": {"lat": 28.7041, "lng": 77.1025},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 28.7041, "lng": 77.1025, "timestamp": "1:00 PM", "duration": 10},
            {"lat": 28.7060, "lng": 77.1080, "timestamp": "1:30 PM", "duration": 20}
          ]
        }
      ]
    },
    {
      "id": 9,
      "name": "Sneha Nair",
      "photoUrl": "https://randomuser.me/api/portraits/women/9.jpg",
      "currentLocation": {"lat": 15.3173, "lng": 75.7139},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 15.3173, "lng": 75.7139, "timestamp": "12:00 PM", "duration": 15},
            {"lat": 15.3200, "lng": 75.7200, "timestamp": "12:30 PM", "duration": 20}
          ]
        }
      ]
    },
    {
      "id": 10,
      "name": "Karan Joshi",
      "photoUrl": "https://randomuser.me/api/portraits/men/10.jpg",
      "currentLocation": {"lat": -33.8688, "lng": 151.2093},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 28.6139, "lng": 77.2090, "timestamp": "9:30 AM", "duration": 10},
            {"lat": 28.6170, "lng": 77.2100, "timestamp": "10:00 AM", "duration": 20}
          ]
        }
      ]
    },
    {
      "id": 11,
      "name": "Nisha Sethi",
      "photoUrl": "https://randomuser.me/api/portraits/women/11.jpg",
      "currentLocation": {"lat": 22.5726, "lng": 88.3639},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 22.5726, "lng": 88.3639, "timestamp": "9:00 AM", "duration": 30},
            {"lat": 22.5750, "lng": 88.3700, "timestamp": "9:45 AM", "duration": 20}
          ]
        }
      ]
    },
    {
      "id": 12,
      "name": "Rohit Bhatia",
      "photoUrl": "https://randomuser.me/api/portraits/men/12.jpg",
      "currentLocation": {"lat": 19.0760, "lng": 72.8777},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 19.0760, "lng": 72.8777, "timestamp": "11:00 AM", "duration": 25},
            {"lat": 19.0800, "lng": 72.8800, "timestamp": "11:45 AM", "duration": 15}
          ]
        }
      ]
    },
    {
      "id": 13,
      "name": "Pooja Malhotra",
      "photoUrl": "https://randomuser.me/api/portraits/women/13.jpg",
      "currentLocation": {"lat": 30.7333, "lng": 76.7794},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 30.7333, "lng": 76.7794, "timestamp": "8:15 AM", "duration": 15},
            {"lat": 30.7400, "lng": 76.7800, "timestamp": "8:45 AM", "duration": 25}
          ]
        }
      ]
    },
    {
      "id": 14,
      "name": "Kriti Sharma",
      "photoUrl": "https://randomuser.me/api/portraits/women/14.jpg",
      "currentLocation": {"lat": 28.4595, "lng": 77.0266},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 28.4595, "lng": 77.0266, "timestamp": "10:30 AM", "duration": 20},
            {"lat": 28.4630, "lng": 77.0290, "timestamp": "11:00 AM", "duration": 30}
          ]
        }
      ]
    },
    {
      "id": 15,
      "name": "Devansh Tyagi",
      "photoUrl": "https://randomuser.me/api/portraits/men/15.jpg",
      "currentLocation": {"lat": 26.8467, "lng": 80.9462},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 26.8467, "lng": 80.9462, "timestamp": "12:00 PM", "duration": 15},
            {"lat": 26.8490, "lng": 80.9500, "timestamp": "12:30 PM", "duration": 20}
          ]
        }
      ]
    },
    {
      "id": 16,
      "name": "Neha Agarwal",
      "photoUrl": "https://randomuser.me/api/portraits/women/16.jpg",
      "currentLocation": {"lat": 19.0760, "lng": 72.8777},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 19.0760, "lng": 72.8777, "timestamp": "1:00 PM", "duration": 15},
            {"lat": 19.0800, "lng": 72.8810, "timestamp": "1:30 PM", "duration": 20}
          ]
        }
      ]
    },
    {
      "id": 17,
      "name": "Arjun Mehta",
      "photoUrl": "https://randomuser.me/api/portraits/men/17.jpg",
      "currentLocation": {"lat": 22.3193, "lng": 70.7519},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 22.3193, "lng": 70.7519, "timestamp": "3:00 PM", "duration": 20},
            {"lat": 22.3230, "lng": 70.7565, "timestamp": "3:30 PM", "duration": 25}
          ]
        }
      ]
    },
    {
      "id": 18,
      "name": "Saanvi Rathi",
      "photoUrl": "https://randomuser.me/api/portraits/women/18.jpg",
      "currentLocation": {"lat": 12.9716, "lng": 77.5946},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 12.9716, "lng": 77.5946, "timestamp": "10:00 AM", "duration": 20},
            {"lat": 12.9750, "lng": 77.6000, "timestamp": "10:30 AM", "duration": 30}
          ]
        }
      ]
    },
    {
      "id": 19,
      "name": "Kavya Sharma",
      "photoUrl": "https://randomuser.me/api/portraits/women/19.jpg",
      "currentLocation": {"lat": 28.6139, "lng": 77.2090},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 28.6139, "lng": 77.2090, "timestamp": "11:15 AM", "duration": 15},
            {"lat": 28.6180, "lng": 77.2150, "timestamp": "11:45 AM", "duration": 25}
          ]
        }
      ]
    },
    {
      "id": 20,
      "name": "Rahul Joshi",
      "photoUrl": "https://randomuser.me/api/portraits/men/20.jpg",
      "currentLocation": {"lat": 30.7333, "lng": 76.7794},
      "timeline": [
        {
          "date": "2024-10-14",
          "visitedLocations": [
            {"lat": 30.7333, "lng": 76.7794, "timestamp": "2:00 PM", "duration": 10},
            {"lat": 30.7370, "lng": 76.7820, "timestamp": "2:30 PM", "duration": 20}
          ]
        }
      ]
    }
  ]
}
    ''';
    var data = json.decode(jsonData);
    members.value = AttendanceResponse.fromJson(data).members;
  }
}
