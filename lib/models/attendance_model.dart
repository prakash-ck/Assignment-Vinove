
class VisitedLocation {
  final double lat;
  final double lng;
  final String timestamp;
  final int duration;

  VisitedLocation({
    required this.lat,
    required this.lng,
    required this.timestamp,
    required this.duration,
  });

  factory VisitedLocation.fromJson(Map<String, dynamic> json) {
    return VisitedLocation(
      lat: json['lat'],
      lng: json['lng'],
      timestamp: json['timestamp'],
      duration: json['duration'],
    );
  }
}

class Timeline {
  final String date;
  final List<VisitedLocation> visitedLocations;

  Timeline({
    required this.date,
    required this.visitedLocations,
  });

  factory Timeline.fromJson(Map<String, dynamic> json) {
    var locations = json['visitedLocations'] as List;
    List<VisitedLocation> visitedList = locations.map((i) => VisitedLocation.fromJson(i)).toList();

    return Timeline(
      date: json['date'],
      visitedLocations: visitedList,
    );
  }
}

class Member {
  final int id;
  final String name;
  final String photoUrl;
  final CurrentLocation currentLocation; // Using the new CurrentLocation model
  final List<Timeline> timeline;

  Member({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.currentLocation,
    required this.timeline,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    var timelines = json['timeline'] as List;
    List<Timeline> timelineList = timelines.map((i) => Timeline.fromJson(i)).toList();

    return Member(
      id: json['id'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      currentLocation: CurrentLocation.fromJson(json['currentLocation']), // Use CurrentLocation model
      timeline: timelineList,
    );
  }
}

class CurrentLocation {
  final double lat;
  final double lng;

  CurrentLocation({
    required this.lat,
    required this.lng,
  });

  factory CurrentLocation.fromJson(Map<String, dynamic> json) {
    return CurrentLocation(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}


class AttendanceResponse {
  final List<Member> members;

  AttendanceResponse({
    required this.members,
  });

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) {
    var members = json['members'] as List;
    List<Member> memberList = members.map((i) => Member.fromJson(i)).toList();

    return AttendanceResponse(
      members: memberList,
    );
  }
}
