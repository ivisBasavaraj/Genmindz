
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/login_screen.dart';
import '../features/role/role_selection_screen.dart';
import '../features/role/access_matrix_screen.dart';
import '../features/scanner/scanner_screen.dart';
import '../features/visitors/visitors_screen.dart';
import '../features/visitors/visitor_requests_screen.dart';
import '../features/visitors/visitor_detail_screen.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/notifications/notifications_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/profile/organization_profile_screen.dart';
import '../features/settings/system_settings_screen.dart';
import '../features/audit_log/audit_registry_screen.dart';
import '../features/gate_access/gate_access_screen.dart';
import '../features/appointments/appointments_screen.dart';
import '../features/staff/staff_directory_screen.dart';
import '../features/security/security_force_screen.dart';
import '../core/widgets/main_navigation.dart';
import '../models/visitor.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/role-selection',
      name: 'role-selection',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => MainNavigation(child: child),
      routes: [
        GoRoute(
          path: '/scanner',
          name: 'scanner',
          builder: (context, state) => const ScannerScreen(),
        ),
        GoRoute(
          path: '/visitors',
          name: 'visitors',
          builder: (context, state) => const VisitorsScreen(),
        ),
        GoRoute(
          path: '/visitor-requests',
          name: 'visitor-requests',
          builder: (context, state) => const VisitorRequestsScreen(),
        ),
        GoRoute(
          path: '/dashboard',
          name: 'dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/notifications',
          name: 'notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/organization-profile',
          name: 'organization-profile',
          builder: (context, state) => const OrganizationProfileScreen(),
        ),
        GoRoute(
          path: '/appointments',
          name: 'appointments',
          builder: (context, state) => const AppointmentsScreen(),
        ),
        GoRoute(
          path: '/staff-directory',
          name: 'staff-directory',
          builder: (context, state) => const StaffDirectoryScreen(),
        ),
        GoRoute(
          path: '/gate-access',
          name: 'gate-access',
          builder: (context, state) => const GateAccessScreen(),
        ),
        GoRoute(
          path: '/security-force',
          name: 'security-force',
          builder: (context, state) => const SecurityForceScreen(),
        ),
        GoRoute(
          path: '/access-matrix',
          name: 'access-matrix',
          builder: (context, state) => const AccessMatrixScreen(),
        ),
        GoRoute(
          path: '/billing',
          name: 'billing',
          builder: (context, state) => const Scaffold(body: Center(child: Text('Billing & History'))),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => const SystemSettingsScreen(),
        ),
        GoRoute(
          path: '/audit-log',
          name: 'audit-log',
          builder: (context, state) => const AuditRegistryScreen(),
        ),
        GoRoute(
          path: '/help-desk',
          name: 'help-desk',
          builder: (context, state) => const Scaffold(body: Center(child: Text('Help Desk'))),
        ),
        GoRoute(
          path: '/visitor-detail/:id',
          name: 'visitor-detail',
          builder: (context, state) {
            final visitor = state.extra as Visitor?;
            if (visitor == null) {
              // Fallback if visitor is not passed via extra
              return const Scaffold(
                body: Center(
                  child: Text('Visitor not found'),
                ),
              );
            }
            return VisitorDetailScreen(visitor: visitor);
          },
        ),
      ],
    ),
  ],
);