enum VisitorStatus { pending, approved, checkedIn, overstay }

class Visitor {
  final String id;
  // Identity Metadata
  final String name;
  final String email;
  final String phone;
  final String organizationName;
  // Assignment & Clearance
  final String personToMeet;
  final String department;
  final String visitType;
  final String purpose;
  // Operational Window
  final DateTime visitingDate;
  final String timeFrom;
  final String timeTo;
  // Facility Logistics
  final String? documentType;
  final String? documentNumber;
  final String? personalBelongings;
  final VisitorStatus status;
  final String? avatar;

  Visitor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.organizationName,
    required this.personToMeet,
    required this.department,
    required this.visitType,
    required this.purpose,
    required this.visitingDate,
    required this.timeFrom,
    required this.timeTo,
    this.documentType,
    this.documentNumber,
    this.personalBelongings,
    required this.status,
    this.avatar,
  });

  // Legacy getter for backward compatibility
  String get host => personToMeet;
  DateTime get visitTime => visitingDate;
}