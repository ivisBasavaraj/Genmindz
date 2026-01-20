import 'package:flutter/material.dart';

class AccessItem {
  final String id;
  final String title;
  final String description;
  final bool isAuthorized;

  AccessItem({
    required this.id,
    required this.title,
    required this.description,
    this.isAuthorized = true,
  });
}

class AccessSection {
  final String title;
  final IconData icon;
  final List<AccessItem> items;

  AccessSection({
    required this.title,
    required this.icon,
    required this.items,
  });

  int get authorizedCount => items.where((item) => item.isAuthorized).length;
  int get totalCount => items.length;
}

final List<AccessSection> accessMatrixData = [
  AccessSection(
    title: 'VISITOR REQUESTS SECTION',
    icon: Icons.assignment_outlined,
    items: [
      AccessItem(
        id: 'vr1',
        title: 'View Requests',
        description: 'Monitor incoming visitor traffic',
      ),
      AccessItem(
        id: 'vr2',
        title: 'Create Requests',
        description: 'Initiate guest registrations',
      ),
      AccessItem(
        id: 'vr3',
        title: 'Authorize Entry',
        description: 'Approve or reject visitor requests',
      ),
      AccessItem(
        id: 'vr4',
        title: 'Purge Records',
        description: 'Remove visitor history entries',
      ),
    ],
  ),
  AccessSection(
    title: 'APPOINTMENTS SECTION',
    icon: Icons.calendar_today_outlined,
    items: [
      AccessItem(
        id: 'ap1',
        title: 'View Appointments',
        description: 'Access facility appointment logs',
      ),
      AccessItem(
        id: 'ap2',
        title: 'Manage Tasks',
        description: 'Add or modify operational activities',
      ),
    ],
  ),
  AccessSection(
    title: 'STAFF DIRECTORY SECTION',
    icon: Icons.people_outline,
    items: [
      AccessItem(
        id: 'sd1',
        title: 'View Personnel',
        description: 'Access employee and host list',
      ),
      AccessItem(
        id: 'sd2',
        title: 'Manage Staff',
        description: 'Edit staff roles and profiles',
      ),
    ],
  ),
  AccessSection(
    title: 'SECURITY FORCE SECTION',
    icon: Icons.shield_outlined,
    items: [
      AccessItem(
        id: 'sf1',
        title: 'View Force',
        description: 'Monitor security personnel list',
      ),
    ],
  ),
  AccessSection(
    title: 'GATE ACCESS SECTION',
    icon: Icons.security_outlined,
    items: [
      AccessItem(
        id: 'ga1',
        title: 'QR Validation',
        description: 'Operate terminal scanning point',
      ),
      AccessItem(
        id: 'ga2',
        title: 'Manual Walk-in',
        description: 'Register unannounced guests',
      ),
    ],
  ),
  AccessSection(
    title: 'AUDIT LOG SECTION',
    icon: Icons.show_chart,
    items: [
      AccessItem(
        id: 'al1',
        title: 'System Logs',
        description: 'Access administrative audit trail',
      ),
      AccessItem(
        id: 'al2',
        title: 'Gate Logs',
        description: 'Access security checkpoint logs',
      ),
    ],
  ),
  AccessSection(
    title: 'CONFIGURATION SECTION',
    icon: Icons.settings_outlined,
    items: [
      AccessItem(
        id: 'c1',
        title: 'Master Config',
        description: 'Adjust critical system parameters',
      ),
      AccessItem(
        id: 'c2',
        title: 'Form Builder',
        description: 'Customize registration form fields',
      ),
      AccessItem(
        id: 'c3',
        title: 'Badge Designer',
        description: 'Configure Visitor and Operational Pass badge fields',
      ),
      AccessItem(
        id: 'c4',
        title: 'Terms & Conditions',
        description: 'Manage facility access policies and visitor consent rules',
      ),
      AccessItem(
        id: 'c5',
        title: 'Gate Management',
        description: 'Configure facility entry/exit points',
      ),
      AccessItem(
        id: 'c6',
        title: 'Visit Types',
        description: 'Manage visitor classification options',
      ),
    ],
  ),
  AccessSection(
    title: 'GOVERNANCE SECTION',
    icon: Icons.gavel_outlined,
    items: [
      AccessItem(
        id: 'g1',
        title: 'Pass Categories',
        description: 'Configure operational pass types',
      ),
      AccessItem(
        id: 'g2',
        title: 'Role Governance',
        description: 'Modify this authority matrix',
      ),
      AccessItem(
        id: 'g3',
        title: 'Billing Control',
        description: 'Manage subscriptions and history',
      ),
      AccessItem(
        id: 'g4',
        title: 'Advanced Analytics',
        description: 'Access deep insights reports',
        isAuthorized: false,
      ),
      AccessItem(
        id: 'g5',
        title: 'Data Extraction',
        description: 'Download CSV/Excel data from registry',
      ),
    ],
  ),
  AccessSection(
    title: 'SUPPORT DESK SECTION',
    icon: Icons.chat_bubble_outline,
    items: [
      AccessItem(
        id: 's1',
        title: 'Help Access',
        description: 'Access support documentation and tickets',
      ),
    ],
  ),
];
