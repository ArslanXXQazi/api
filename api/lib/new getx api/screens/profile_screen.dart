import 'package:flutter/material.dart';
import '../../../../src/controller/components/black-text.dart';
import '../components/common_widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Blacktext(
          text: 'Profile',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Profile Avatar
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF667eea),
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xFF667eea),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Name
                  Blacktext(
                    text: 'Siddique',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 8),
                  // Info Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.male, size: 18, color: Colors.grey[600]),
                      SizedBox(width: 4),
                      Blacktext(
                        text: 'Male',
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.cake, size: 18, color: Colors.grey[600]),
                      SizedBox(width: 4),
                      Blacktext(
                        text: '24 years',
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.location_on,
                          size: 18, color: Colors.grey[600]),
                      SizedBox(width: 4),
                      Blacktext(
                        text: 'Unknown',
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Edit Profile Button
                  CustomButton(
                    text: 'Edit Profile',
                    isGradient: true,
                    icon: Icon(Icons.edit, size: 18, color: Colors.white),
                    onPressed: () {},
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            // Stats Section
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('0', 'Followers', Icons.people),
                  _buildDivider(),
                  _buildStatItem('0', 'Following', Icons.person_add),
                  _buildDivider(),
                  _buildStatItem('0', 'Visitors', Icons.visibility),
                ],
              ),
            ),
            SizedBox(height: 12),

            // Bio Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Blacktext(
                    text: 'Bio',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 12),
                  Blacktext(
                    text: 'update bio',
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            // Languages Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Blacktext(
                    text: 'Languages',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 16),
                  _buildLanguageRow('Speaking', ['Spanish'], Icons.volume_up),
                  SizedBox(height: 12),
                  _buildLanguageRow('Learning', ['Spanish'], Icons.school),
                ],
              ),
            ),
            SizedBox(height: 12),

            // Interests Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Blacktext(
                    text: 'Interests',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      'Beginner',
                      'Fluent',
                      'Writing',
                      'Reading',
                      'Speaking'
                    ].map((interest) => _buildInterestChip(interest)).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            // Purchases Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Blacktext(
                    text: 'My Purchases',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 16),
                  _buildPurchaseItem(
                    'Background Theme',
                    'background',
                    '10 coins',
                    Icons.wallpaper,
                    true,
                  ),
                  SizedBox(height: 12),
                  _buildPurchaseItem(
                    'Profile Frame',
                    'user_frame',
                    'Free',
                    Icons.person,
                    false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            // VIP Section
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFB800), Color(0xFFFF8C00)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.diamond,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(height: 12),
                  Blacktext(
                    text: 'VIP Membership',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8),
                  Blacktext(
                    text: 'Unlock exclusive features and benefits',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: 'Upgrade Now',
                    color: Colors.white,
                    textColor: Color(0xFFFF8C00),
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Color(0xFFFF8C00),
                    ),
                    onPressed: () {},
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String count, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFF667eea), size: 28),
        SizedBox(height: 8),
        Blacktext(
          text: count,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 4),
        Blacktext(
          text: label,
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildLanguageRow(
      String label, List<String> languages, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Color(0xFF667eea)),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Blacktext(
                text: label,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF667eea),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: languages
                    .map(
                      (lang) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Blacktext(
                          text: lang,
                          fontSize: 13,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInterestChip(String interest) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF667eea).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF667eea).withOpacity(0.3)),
      ),
      child: Blacktext(
        text: interest,
        fontSize: 13,
        color: Color(0xFF667eea),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildPurchaseItem(
    String title,
    String category,
    String price,
    IconData icon,
    bool isPaid,
  ) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isPaid ? Color(0xFF667eea) : Color(0xFF56ab2f),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Blacktext(
                  text: title,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4),
                Blacktext(
                  text: category.replaceAll('_', ' '),
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isPaid
                  ? Color(0xFF667eea).withOpacity(0.1)
                  : Color(0xFF56ab2f).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Blacktext(
              text: price,
              fontSize: 13,
              color: isPaid ? Color(0xFF667eea) : Color(0xFF56ab2f),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
