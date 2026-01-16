import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'visitor_profile_modal.dart';

class VisitorRequestsScreen extends StatefulWidget {
  const VisitorRequestsScreen({super.key});

  @override
  State<VisitorRequestsScreen> createState() => _VisitorRequestsScreenState();
}

class _VisitorRequestsScreenState extends State<VisitorRequestsScreen> {
  int _selectedTabIndex = 0;
  String _selectedStatusFilter = 'ALL REQUESTS';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        children: [
          _buildTabSwitcher(),
          const SizedBox(height: 18),
          _buildSearchAndControls(),
          const SizedBox(height: 18),
          _buildStatusFilters(),
          const SizedBox(height: 18),
          if (_selectedTabIndex == 1) ...[_buildInvitationRegistry(), const SizedBox(height: 18)],
          if (_selectedTabIndex == 2) ...[_buildOperationalLedger(), const SizedBox(height: 18)],
          _buildVisitorCard(),
          const SizedBox(height: 14),
          _buildVisitorCard(
            name: 'EMILY DAVIS',
            org: 'GLOBAL TECH',
            status: 'PENDING',
            statusColor: const Color(0xFFF59E0B),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildTabSwitcher() {
    return Container(
      height: 44,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          _buildTabItem(0, 'Record Log'),
          _buildTabItem(1, 'Pre-Register'),
          _buildTabItem(2, 'Operational'),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    final isActive = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF4F46E5) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              color: isActive ? Colors.white : const Color(0xFF64748B),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchAndControls() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Color(0xFF94A3B8), size: 20),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search registr',
                      hintStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        _buildActionButton(Icons.grid_view_rounded),
        const SizedBox(width: 8),
        _buildActionButton(Icons.list_rounded, isActive: true),
        const SizedBox(width: 8),
        _buildActionButton(Icons.filter_list_rounded),
        const SizedBox(width: 8),
        _buildActionButton(Icons.download_rounded),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, {bool isActive = false}) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF4F46E5).withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isActive ? Border.all(color: const Color(0xFF4F46E5).withOpacity(0.2)) : null,
      ),
      child: Icon(icon, size: 20, color: isActive ? const Color(0xFF4F46E5) : const Color(0xFF64748B)),
    );
  }

  Widget _buildStatusFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildFilterPill('ALL REQUESTS'),
          const SizedBox(width: 10),
          _buildFilterPill('INVITED'),
          const SizedBox(width: 10),
          _buildFilterPill('PENDING'),
          const SizedBox(width: 10),
          _buildFilterPill('CHECKED-IN'),
        ],
      ),
    );
  }

  Widget _buildFilterPill(String label) {
    final isActive = _selectedStatusFilter == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedStatusFilter = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF4F46E5) : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : const Color(0xFF334155),
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildVisitorCard({
    String name = 'JOHN SMITH',
    String org = 'TECH CORP',
    String status = 'APPROVED',
    Color statusColor = const Color(0xFF22C55E),
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
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
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F172A)),
                    ),
                    Text(
                      org,
                      style: const TextStyle(color: Color(0xFF64748B), fontSize: 11),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor, fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.more_vert, color: Color(0xFF94A3B8), size: 20),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1, color: Color(0xFFF1F5F9)),
          ),
          Row(
            children: [
              Expanded(child: _buildInfoItem(Icons.calendar_today_rounded, '20 May @ 10:00 AM')),
              Expanded(child: _buildInfoItem(Icons.person_outline_rounded, 'Sarah Chen')),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Expanded(child: SizedBox()), // Placeholder for alignment
              Expanded(child: _buildInfoItem(Icons.business_outlined, 'HR & ADMIN')),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: _buildButton(
                    'View Pass',
                    Icons.qr_code_rounded,
                    const Color(0xFF4F46E5).withOpacity(0.1),
                    const Color(0xFF4F46E5),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () => VisitorProfileModal.show(
                    context,
                    name: name,
                    email: 'JOHN.SMITH@EXAMPLE.COM',
                    phone: '+1 (555) 123-4567',
                    authId: '#VIS-1001',
                    status: status,
                    statusColor: statusColor,
                  ),
                  child: _buildButton(
                    'View Details',
                    Icons.visibility_outlined,
                    const Color(0xFF4F46E5),
                    Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: const Color(0xFF94A3B8)),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 11, color: Color(0xFF334155), fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildButton(String label, IconData icon, Color bgColor, Color textColor) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildOperationalLedger() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF020617), Color(0xFF0F172A)],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 30,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.shield_rounded, color: Color(0xFFFBBF24), size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'OPERATIONAL PASS LEDGER',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Long term access authorizations for vendors and personnel.',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'ACTIVE PASSES',
                          style: TextStyle(
                            fontSize: 9,
                            color: Color(0xFF64748B),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFBBF24),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFF334155), width: 1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.upload_rounded, color: Colors.white, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'BULK UPLOAD',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF59E0B),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add, color: Colors.white, size: 18),
                          SizedBox(width: 4),
                          Text(
                            'NEW PASS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _buildOperationalPassCard(),
      ],
    );
  }

  Widget _buildOperationalPassCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Color(0xFFF1F5F9),
                child: Icon(Icons.person, color: Color(0xFF64748B), size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'ALEX JOHNSON',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'FACILITY MAINT',
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF22C55E).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'ACTIVE',
                  style: TextStyle(
                    color: Color(0xFF22C55E),
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF4F46E5).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'MAINTENANCE',
                  style: TextStyle(
                    color: Color(0xFF4F46E5),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.calendar_today_rounded, size: 14, color: Color(0xFF94A3B8)),
              const SizedBox(width: 6),
              const Text(
                'Valid Until: 2025-05-31',
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF334155),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => VisitorProfileModal.show(
                    context,
                    name: 'ALEX JOHNSON',
                    email: 'ALEX.JOHNSON@FACILITY.COM',
                    phone: '+1 (555) 987-6543',
                    authId: '#OPS-2001',
                    status: 'ACTIVE',
                    statusColor: const Color(0xFF22C55E),
                  ),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4F46E5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'View Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.copy_rounded, size: 18, color: Color(0xFF64748B)),
              ),
              const SizedBox(width: 8),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.more_vert, size: 18, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInvitationRegistry() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF020617), Color(0xFF0F172A)],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 30,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.person_add_rounded, color: Color(0xFF60A5FA), size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'INVITATION REGISTRY',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Authorized pre-registered guests and active clearance tokens.',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'TOTAL INVITES',
                          style: TextStyle(
                            fontSize: 9,
                            color: Color(0xFF64748B),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFF334155), width: 1.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.link_rounded, color: Colors.white, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'INVITE LINK',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4F46E5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.bolt_rounded, color: Colors.white, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'INSTANT PASS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'NO ACTIVE INVITATIONS MATCH CRITERIA',
          style: TextStyle(
            fontSize: 11,
            color: Color(0xFF94A3B8),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

}
