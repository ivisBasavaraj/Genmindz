import '../models/user.dart';
import '../models/visitor.dart';
import '../models/notification.dart';

class MockData {
  static List<Visitor> get visitors => [
    Visitor(
      id: '1',
      name: 'John Smith',
      email: 'john.smith@example.com',
      phone: '9876543210',
      organizationName: 'Tech Corp',
      personToMeet: 'Sarah Chen',
      department: 'HR & ADMIN',
      visitType: 'Official',
      purpose: 'Interview for Senior Dev role',
      visitingDate: DateTime(2025, 5, 20),
      timeFrom: '10:00 AM',
      timeTo: '11:00 AM',
      documentType: 'Aadhar Card',
      documentNumber: 'ABCD1234EF',
      personalBelongings: 'Laptop',
      status: VisitorStatus.checkedIn,
    ),
    Visitor(
      id: '2',
      name: 'Emily Davis',
      email: 'emily@example.com',
      phone: '+1234567891',
      organizationName: 'Marketing Solutions',
      personToMeet: 'Mike Wilson',
      department: 'Marketing',
      visitType: 'Business',
      purpose: 'Client Presentation',
      visitingDate: DateTime.now().add(const Duration(hours: 2)),
      timeFrom: '2:00 PM',
      timeTo: '3:30 PM',
      status: VisitorStatus.approved,
    ),
    Visitor(
      id: '3',
      name: 'Robert Brown',
      email: 'robert@example.com',
      phone: '+1234567892',
      organizationName: 'Sales Inc',
      personToMeet: 'Lisa Chen',
      department: 'Sales',
      visitType: 'Official',
      purpose: 'Contract Discussion',
      visitingDate: DateTime.now().subtract(const Duration(minutes: 30)),
      timeFrom: '9:30 AM',
      timeTo: '10:30 AM',
      status: VisitorStatus.pending,
    ),
  ];

  static List<AppNotification> get notifications => [
    AppNotification(
      id: '1',
      title: 'Visitor Arrived',
      description: 'John Smith has arrived for the meeting',
      visitor: 'John Smith',
      host: 'Sarah Johnson',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      type: NotificationType.arrival,
      severity: NotificationSeverity.medium,
    ),
    AppNotification(
      id: '2',
      title: 'Approval Required',
      description: 'Emily Davis needs approval for entry',
      visitor: 'Emily Davis',
      host: 'Mike Wilson',
      timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      type: NotificationType.approval,
      severity: NotificationSeverity.high,
    ),
  ];

  static User get securityUser => User(
    id: 'sec1',
    name: 'Security Guard',
    email: 'security@company.com',
    role: UserRole.security,
  );

  static User get employeeUser => User(
    id: 'emp1',
    name: 'John Employee',
    email: 'john@company.com',
    role: UserRole.employee,
  );

  static User get adminUser => User(
    id: 'admin1',
    name: 'Venil Mottana',
    email: 'venil@genminds.com',
    role: UserRole.admin,
  );
}