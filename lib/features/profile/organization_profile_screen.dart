import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';

class OrganizationProfileScreen extends StatefulWidget {
  const OrganizationProfileScreen({super.key});

  @override
  State<OrganizationProfileScreen> createState() => _OrganizationProfileScreenState();
}

class _OrganizationProfileScreenState extends State<OrganizationProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIdentityHeaderCard(context),
            const SizedBox(height: 20),
            _buildGeneralInfoCard(context),
            const SizedBox(height: 20),
            _buildKeyContactCard(context),
            const SizedBox(height: 20),
            _buildSubscriptionCard(context),
            const SizedBox(height: 20),
            _buildQuickLinksCard(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _showEditIdentityModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              // Header & Close
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Edit Organization Identity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Company Mark (Logo Upload)
                      Center(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFE2E8F0),
                                      style: BorderStyle.none, // Will use custom painter for dashed if needed, but let's keep it simple first
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFFF8FAFC),
                                  ),
                                  // Simple implementation of dashed border using a container with border and background
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: const Color(0xFF4F46E5), width: 1),
                                    ),
                                    padding: const EdgeInsets.all(12),
                                    child: Image.asset(
                                      'assets/logo.png',
                                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.business, color: Color(0xFF4F46E5), size: 40),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -5,
                                  top: -5,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.close, size: 12, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'COMPANY MARK',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF64748B),
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Core Identity Section
                      _buildModalSectionHeader('CORE IDENTITY'),
                      const SizedBox(height: 16),
                      _buildModalTextField(
                        label: 'ORGANIZATION LEGAL NAME *',
                        placeholder: 'GenMindz Enterprise',
                        icon: Icons.business_outlined,
                      ),
                      const SizedBox(height: 20),
                      _buildModalTextField(
                        label: 'OFFICIAL REGISTRY EMAIL *',
                        placeholder: 'admin@genmindz.com',
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 20),
                      _buildModalTextField(
                        label: 'PRIMARY PHONE',
                        placeholder: '+91 9380790718',
                        icon: Icons.phone_outlined,
                      ),
                      const SizedBox(height: 20),
                      _buildModalTextField(
                        label: 'REGISTERED ADDRESS *',
                        placeholder: 'Tech Park, Bangalore, KA, India',
                        icon: Icons.location_on_outlined,
                        maxLines: 3,
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Key Contact Personnel Section
                      _buildModalSectionHeader('KEY CONTACT PERSONNEL'),
                      const SizedBox(height: 16),
                      _buildModalTextField(
                        label: 'FULL NAME *',
                        placeholder: 'Venil Mottana',
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 20),
                      _buildModalTextField(
                        label: 'SYSTEM DESIGNATION',
                        placeholder: 'Operational Administrator',
                        icon: Icons.badge_outlined,
                      ),
                      const SizedBox(height: 20),
                      _buildModalTextField(
                        label: 'DIRECT EMAIL',
                        placeholder: 'admin@genmindz.com',
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 20),
                      _buildModalTextField(
                        label: 'DIRECT PHONE',
                        placeholder: '+91 9380790718',
                        icon: Icons.phone_outlined,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
              
              // Footer Actions
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.lock_outline, size: 18),
                        label: const Text('DEPLOY IDENTITY'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4F46E5),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'DISCARD ACTION',
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModalSectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 16,
          decoration: BoxDecoration(
            color: const Color(0xFF4F46E5),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildModalTextField({
    required String label,
    required String placeholder,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Color(0xFF64748B),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
              icon: Icon(icon, size: 20, color: const Color(0xFF64748B)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIdentityHeaderCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Banner Area
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              // Organization Logo (overlapping)
              Positioned(
                right: 24,
                bottom: -25,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/logo.png', // Assuming logo path
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.business, color: Color(0xFF4F46E5)),
                  ),
                ),
              ),
              // Organization Avatar (circular)
              Positioned(
                left: 24,
                bottom: -35,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFFF1F5F9),
                    child: Icon(Icons.person, color: Color(0xFF64748B), size: 35),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'GENMINDZ ENTERPRISE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Text(
                        'TECH PARK',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF64748B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _showEditIdentityModal,
                  icon: const Icon(Icons.edit_outlined, size: 16),
                  label: const Text('EDIT IDENTITY'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F172A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralInfoCard(BuildContext context) {
    return _buildSectionCard(
      title: 'GENERAL INFORMATION',
      children: [
        _buildInfoField('Organization ID', 'NIB138881'),
        _buildInfoField('Official Email', 'admin@genmindz.com'),
        _buildInfoField('Contact Number', '+91 9380790718'),
        _buildInfoField(
          'Website', 
          'GENMINDZ.COM', 
          isLink: true, 
          onTap: () {}, // Action to open external browser
        ),
      ],
    );
  }

  Widget _buildKeyContactCard(BuildContext context) {
    return _buildSectionCard(
      title: 'KEY CONTACT PERSONNEL',
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFF1F5F9),
              child: Icon(Icons.person_outline, color: Color(0xFF4F46E5)),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'VENIL MOTTANA',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                Text(
                  'OPERATIONAL ADMINISTRATOR',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildContactItem(Icons.email_outlined, 'admin@genmindz.com'),
        const SizedBox(height: 12),
        _buildContactItem(Icons.phone_outlined, '+91 9380790718'),
      ],
    );
  }

  Widget _buildSubscriptionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.emoji_events_outlined, color: Color(0xFF4F46E5), size: 28),
              const SizedBox(width: 12),
              const Text(
                'ADVANCED',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF4F46E5).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'ACTIVE',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F46E5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '9999 monthly visitor screenings\n500 operational passes',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'MANAGE SUBSCRIPTION',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinksCard(BuildContext context) {
    return _buildSectionCard(
      title: 'QUICK LINKS',
      padding: EdgeInsets.zero,
      children: [
        _buildQuickLinkItem('Security Audit Logs', Icons.arrow_forward_ios, () => context.goNamed('audit-log')),
        const Divider(height: 1, indent: 16, endIndent: 16),
        _buildQuickLinkItem('Facility Protocols', Icons.arrow_forward_ios, () => {}),
        const Divider(height: 1, indent: 16, endIndent: 16),
        _buildQuickLinkItem('Help Center', Icons.add, () => context.goNamed('help-desk')),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title, 
    required List<Widget> children,
    EdgeInsets? padding,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF64748B),
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          padding: padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoField(String label, String value, {bool isLink = false, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isLink ? const Color(0xFF4F46E5) : const Color(0xFF0F172A),
                  ),
                ),
                if (isLink) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.open_in_new, size: 14, color: Color(0xFF4F46E5)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF4F46E5)),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinkItem(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
            Icon(icon, size: 16, color: const Color(0xFF64748B)),
          ],
        ),
      ),
    );
  }
}
