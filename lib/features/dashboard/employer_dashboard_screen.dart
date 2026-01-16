import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmployerDashboardScreen extends StatelessWidget {
  const EmployerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        children: [
          _buildProfileCard(context),
          const SizedBox(height: 18),
          _buildLicenseQuotaCard(),
          const SizedBox(height: 18),
          _buildStatsGrid(),
          const SizedBox(height: 18),
          _buildLiveVisitLedger(),
          const SizedBox(height: 18),
          _buildVMSFeed(),
          const SizedBox(height: 18),
          _buildTrafficDensity(),
          const SizedBox(height: 18),
          _buildPersonnelMix(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.shield_outlined, color: Color(0xFF4F46E5), size: 30),
          ),
          const SizedBox(height: 16),
          const Text(
            'System Monitor: Venil Mottana',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'SUPER ADMIN',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4F46E5),
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildMetaRow(Icons.location_on_outlined, 'TECH PARK, BANGALURU, KA, INDIA'),
          const SizedBox(height: 8),
          _buildMetaRow(Icons.email_outlined, 'ADMIN@GENMINDZ.COM'),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () => context.goNamed('gate-access'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                elevation: 0,
              ),
              child: const Text(
                'REGISTRATION FORM',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 0.5),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildSecondaryAction(Icons.copy_all_rounded)),
              const SizedBox(width: 12),
              Expanded(child: _buildSecondaryAction(Icons.lock_outline_rounded)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetaRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 14, color: const Color(0xFF64748B)),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
        ),
      ],
    );
  }

  Widget _buildSecondaryAction(IconData icon) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: const Color(0xFF4F46E5), size: 20),
    );
  }

  Widget _buildLicenseQuotaCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF020617), Color(0xFF0F172A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'LICENSE QUOTA',
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'ADVANCED TIER',
                  style: TextStyle(color: Colors.white70, fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildQuotaMetric('Monthly Regs', '82 / 999', 82 / 999, const Color(0xFF3B82F6)),
          const SizedBox(height: 20),
          _buildQuotaMetric('Op. Passes', '12 / 500', 12 / 500, const Color(0xFFF59E0B)),
        ],
      ),
    );
  }

  Widget _buildQuotaMetric(String label, String value, double progress, Color color) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.circle, size: 8, color: color),
                const SizedBox(width: 8),
                Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.white10,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 6,
          borderRadius: BorderRadius.circular(3),
        ),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      childAspectRatio: 2.6,
      children: [
        _buildStatCard('TOTAL VISITOR', '1', Icons.people_outline, const Color(0xFFE0F2FE), const Color(0xFF0EA5E9)),
        _buildStatCard('SEC. FORCE', '0 / 50', Icons.shield_rounded, const Color(0xFFF0FDF4), const Color(0xFF22C55E)),
        _buildStatCard('TOTAL PASSES', '1', Icons.badge_outlined, const Color(0xFFEEF2FF), const Color(0xFF6366F1)),
        _buildStatCard('STAFF LOAD', '0 / 500', Icons.groups_outlined, const Color(0xFFFFF7ED), const Color(0xFFF97316)),
        _buildStatCard('RIGHTS MATRIX', '6', Icons.grid_view_outlined, const Color(0xFFFAF5FF), const Color(0xFFA855F7)),
        _buildStatCard('GUEST INVITES', '0', Icons.mail_outline, const Color(0xFFFFF1F2), const Color(0xFFF43F5E)),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, size: 16, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
                ),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveVisitLedger() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.circle, size: 10, color: Color(0xFFEF4444)),
                const SizedBox(width: 8),
                const Text(
                  'LIVE VISIT LEDGER',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text('FULL REGISTRY →', style: TextStyle(fontSize: 10, color: Color(0xFF4F46E5), fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFF1F5F9),
                    child: Icon(Icons.person, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('John Smith', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const Text('ID: #VIS-1001', style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(8)),
                    child: const Text('APPROVED', style: TextStyle(color: Color(0xFF16A34A), fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(height: 1),
              ),
              Row(
                children: [
                  Expanded(child: _buildVisitDetail('Schedule', '20 May, 10:00 AM')),
                  Expanded(child: _buildVisitDetail('Host / Unit', 'Sarah Chen, HR & ADMIN')),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_outlined, size: 16),
                      label: const Text('VIEW DETAILS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4F46E5),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(12)),
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz, color: Color(0xFF64748B))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVisitDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF64748B))),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
      ],
    );
  }

  Widget _buildVMSFeed() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.notifications_active, color: Color(0xFFEF4444), size: 18),
              const SizedBox(width: 8),
              const Text('VMS FEED', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 30),
          const Text('NO ACTIVE ALERTS', style: TextStyle(color: Color(0xFF64748B), fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildTrafficDensity() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('TRAFFIC DENSITY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          const Text('VOLUME ANALYSIS (WEEKLY)', style: TextStyle(color: Color(0xFF64748B), fontSize: 10)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTabItem('DAY', false),
                _buildTabItem('WEEK', true),
                _buildTabItem('YEAR', false),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'].map((day) {
                return _buildBar(day, day == 'TUE' ? 0.9 : 0.05);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF4F46E5) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: active ? Colors.white : const Color(0xFF64748B)),
      ),
    );
  }

  Widget _buildBar(String label, double factor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 24,
          height: 100 * factor,
          decoration: BoxDecoration(
            color: factor > 0.1 ? const Color(0xFF4F46E5) : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 9, color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildPersonnelMix() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('PERSONNEL MIX', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 24),
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircularProgressIndicator(
                      value: 0.8,
                      strokeWidth: 10,
                      backgroundColor: Color(0xFFF1F5F9),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF59E0B)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('NODES', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                  children: [
                    _buildLegend('Employees', '0', const Color(0xFF3B82F6)),
                    const SizedBox(height: 10),
                    _buildLegend('Security', '0', const Color(0xFF22C55E)),
                    const SizedBox(height: 10),
                    _buildLegend('Management', '1', const Color(0xFFF59E0B)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
          ],
        ),
        Text(value, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }


}
