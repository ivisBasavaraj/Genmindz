import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.82,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4F46E5), Color(0xFF818CF8)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.grid_view_rounded, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'GenMindz',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        Text(
                          'The Next gen tech',
                          style: TextStyle(
                            fontSize: 10,
                            color: const Color(0xFF64748B).withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Color(0xFF64748B)),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  _buildDrawerItem(
                    context,
                    Icons.dashboard_outlined,
                    'My Workspace',
                    location == '/dashboard',
                    () => context.goNamed('dashboard'),
                  ),
                  _buildDrawerItem(
                    context,
                    Icons.people_alt_outlined,
                    'Visitor Requests',
                    location == '/visitor-requests',
                    () => context.goNamed('visitor-requests'),
                  ),
                  _buildDrawerItem(context, Icons.sensor_door_outlined, 'Gate Access', false, () => context.goNamed('gate-access')),
                  _buildDrawerItem(context, Icons.calendar_month_outlined, 'Appointments', false, () => context.goNamed('appointments')),
                  _buildDrawerItem(context, Icons.folder_shared_outlined, 'Staff Directory', location == '/staff-directory', () => context.goNamed('staff-directory')),
                  _buildDrawerItem(context, Icons.shield_outlined, 'Security Force', false, () => context.goNamed('security-force')),
                  _buildDrawerItem(context, Icons.grid_4x4_rounded, 'Access Matrix', false, () => context.goNamed('access-matrix')),
                  _buildDrawerItem(context, Icons.business_outlined, 'Org Profile', false, () => context.goNamed('profile')),
                  _buildDrawerItem(context, Icons.receipt_long_outlined, 'Billing & History', false, () => context.goNamed('billing')),
                  _buildDrawerItem(context, Icons.settings_outlined, 'System Settings', false, () => context.goNamed('settings')),
                  _buildDrawerItem(context, Icons.history_outlined, 'Audit Log', false, () => context.goNamed('audit-log')),
                  _buildDrawerItem(context, Icons.help_outline, 'Help Desk', false, () => context.goNamed('help-desk')),
                ],
              ),
            ),
            // Access Node
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'ACCESS NODE',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF64748B),
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Super Admin',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Exit Button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextButton.icon(
                onPressed: () {
                   Navigator.pop(context);
                   context.goNamed('login');
                },
                icon: const Icon(Icons.logout, color: Color(0xFFEF4444), size: 18),
                label: const Text(
                  'EXIT SESSION',
                  style: TextStyle(
                    color: Color(0xFFEF4444),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF4F46E5) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              onTap();
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Icon(icon, size: 20, color: isActive ? Colors.white : const Color(0xFF334155)),
                  const SizedBox(width: 12),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                      color: isActive ? Colors.white : const Color(0xFF334155),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
