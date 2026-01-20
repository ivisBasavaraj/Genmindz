import 'package:flutter/material.dart';

enum FieldRequirement { req, opt }

class FormFieldConfig {
  final String id;
  final String name;
  final IconData icon;
  final FieldRequirement requirement;
  final bool isVisible;
  final bool isSystemPolicy;
  final String position;

  FormFieldConfig({
    required this.id,
    required this.name,
    required this.icon,
    this.requirement = FieldRequirement.req,
    this.isVisible = true,
    this.isSystemPolicy = false,
    required this.position,
  });
}

class FormSection {
  final String title;
  final List<FormFieldConfig> fields;

  FormSection({
    required this.title,
    required this.fields,
  });
}

final List<FormSection> formBuilderData = [
  FormSection(
    title: 'PERSONAL & PROFESSIONAL',
    fields: [
      FormFieldConfig(
        id: 'p1',
        name: 'Upload Profile Photo',
        icon: Icons.add_a_photo_outlined,
        requirement: FieldRequirement.req,
        isSystemPolicy: true,
        position: '01',
      ),
      FormFieldConfig(
        id: 'p2',
        name: 'Name',
        icon: Icons.person_outline,
        requirement: FieldRequirement.req,
        isSystemPolicy: true,
        position: '02',
      ),
      FormFieldConfig(
        id: 'p3',
        name: 'Gender',
        icon: Icons.wc_outlined,
        requirement: FieldRequirement.opt,
        position: '03',
      ),
      FormFieldConfig(
        id: 'p4',
        name: 'Email',
        icon: Icons.email_outlined,
        requirement: FieldRequirement.req,
        position: '04',
      ),
      FormFieldConfig(
        id: 'p5',
        name: 'Organization Name',
        icon: Icons.business_outlined,
        requirement: FieldRequirement.req,
        position: '05',
      ),
      FormFieldConfig(
        id: 'p6',
        name: 'Phone',
        icon: Icons.phone_outlined,
        requirement: FieldRequirement.req,
        position: '06',
      ),
    ],
  ),
  FormSection(
    title: 'VISIT CONTEXT',
    fields: [
      FormFieldConfig(
        id: 'v1',
        name: 'Visit Type',
        icon: Icons.category_outlined,
        requirement: FieldRequirement.req,
        isSystemPolicy: true,
        position: '07',
      ),
      FormFieldConfig(
        id: 'v2',
        name: 'Purpose of Visit',
        icon: Icons.description_outlined,
        requirement: FieldRequirement.req,
        position: '08',
      ),
      FormFieldConfig(
        id: 'v3',
        name: 'Person To Meet',
        icon: Icons.person_search_outlined,
        requirement: FieldRequirement.req,
        position: '09',
      ),
      FormFieldConfig(
        id: 'v4',
        name: 'Department',
        icon: Icons.account_tree_outlined,
        requirement: FieldRequirement.req,
        position: '10',
      ),
      FormFieldConfig(
        id: 'v5',
        name: 'Visiting Date',
        icon: Icons.calendar_today_outlined,
        requirement: FieldRequirement.req,
        position: '11',
      ),
      FormFieldConfig(
        id: 'v6',
        name: 'Time From',
        icon: Icons.access_time_outlined,
        requirement: FieldRequirement.req,
        position: '12',
      ),
    ],
  ),
  FormSection(
    title: 'FACILITY LOGISTICS',
    fields: [
      FormFieldConfig(
        id: 'l1',
        name: 'Entry Gate',
        icon: Icons.sensor_door_outlined,
        requirement: FieldRequirement.opt,
        position: '13',
      ),
      FormFieldConfig(
        id: 'l2',
        name: 'Personal Belongings',
        icon: Icons.backpack_outlined,
        requirement: FieldRequirement.opt,
        position: '14',
      ),
      FormFieldConfig(
        id: 'l3',
        name: 'Bringing Vehicle?',
        icon: Icons.directions_car_outlined,
        requirement: FieldRequirement.opt,
        position: '15',
      ),
      FormFieldConfig(
        id: 'l4',
        name: 'Vehicle Number',
        icon: Icons.pin_outlined,
        requirement: FieldRequirement.opt,
        position: '16',
      ),
    ],
  ),
  FormSection(
    title: 'LEGAL & IDENTITY',
    fields: [
      FormFieldConfig(
        id: 'i1',
        name: 'Document Type',
        icon: Icons.badge_outlined,
        requirement: FieldRequirement.req,
        isSystemPolicy: true,
        position: '17',
      ),
      FormFieldConfig(
        id: 'i2',
        name: 'Document Number',
        icon: Icons.numbers_outlined,
        requirement: FieldRequirement.req,
        isSystemPolicy: true,
        position: '18',
      ),
      FormFieldConfig(
        id: 'i3',
        name: 'Upload Govt ID',
        icon: Icons.file_upload_outlined,
        requirement: FieldRequirement.req,
        position: '19',
      ),
      FormFieldConfig(
        id: 'i4',
        name: 'Terms & Conditions',
        icon: Icons.gavel_outlined,
        requirement: FieldRequirement.req,
        isSystemPolicy: true,
        position: '20',
      ),
    ],
  ),
];
