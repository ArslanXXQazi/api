import 'package:flutter/material.dart';
import '../../../../src/controller/components/black-text.dart';
import '../components/common_widgets/custom_button.dart';
import '../components/common_widgets/profile_header_badge.dart';
import '../components/common_widgets/stat_card.dart';
import '../components/common_widgets/modern_card.dart';
import '../components/common_widgets/language_item.dart';
import '../components/common_widgets/interest_chip.dart';
import '../components/common_widgets/purchase_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: CustomScrollView(
        slivers: [
          // Modern Header with Gradient
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            elevation: 0,
            backgroundColor: Color(0xFF667eea),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF667eea),
                          Color(0xFF764ba2),
                        ],
                      ),
                    ),
                  ),
                  // Decorative circles
                  Positioned(
                    top: -80,
                    right: -80,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: -50,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.08),
                      ),
                    ),
                  ),
                  // Profile Content
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        // Profile Image
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white70],
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 48,
                                  backgroundColor: Color(0xFFE8EEFF),
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Color(0xFF667eea),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF56ab2f),
                                        Color(0xFFa8e063),
                                      ],
                                    ),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 3),
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
                        ),
                        SizedBox(height: 12),
                        // Name
                        Blacktext(
                          text: 'Siddique',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        SizedBox(height: 6),
                        // Info badges using ProfileHeaderBadge widget
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileHeaderBadge(icon: Icons.male, text: 'Male'),
                            SizedBox(width: 8),
                            ProfileHeaderBadge(icon: Icons.cake, text: '24'),
                            SizedBox(width: 8),
                            ProfileHeaderBadge(
                                icon: Icons.location_on, text: 'Unknown'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.settings_outlined, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Stats Cards using StatCard widget
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        StatCard(
                          count: '0',
                          label: 'Followers',
                          color: Color(0xFF667eea),
                        ),
                        Container(
                            width: 1, height: 50, color: Colors.grey[200]),
                        StatCard(
                          count: '0',
                          label: 'Following',
                          color: Color(0xFF764ba2),
                        ),
                        Container(
                            width: 1, height: 50, color: Colors.grey[200]),
                        StatCard(
                          count: '0',
                          label: 'Visitors',
                          color: Color(0xFFf093fb),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Edit Profile Button
                  CustomButton(
                    text: 'Edit Profile',
                    isGradient: true,
                    icon: Icon(Icons.edit_outlined,
                        size: 20, color: Colors.white),
                    onPressed: () {},
                    width: double.infinity,
                    height: 54,
                  ),
                  SizedBox(height: 20),

                  // Bio Section using ModernCard
                  ModernCard(
                    icon: Icons.info_outline,
                    iconColor: Color(0xFF667eea),
                    title: 'About Me',
                    child: Blacktext(
                      text: 'update bio',
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Languages Section using ModernCard and LanguageItem
                  ModernCard(
                    icon: Icons.language,
                    iconColor: Color(0xFF56ab2f),
                    title: 'Languages',
                    child: Column(
                      children: [
                        LanguageItem(
                          label: 'Speaking',
                          languages: ['Spanish'],
                          color: Color(0xFF667eea),
                        ),
                        SizedBox(height: 12),
                        Divider(height: 1),
                        SizedBox(height: 12),
                        LanguageItem(
                          label: 'Learning',
                          languages: ['Spanish'],
                          color: Color(0xFFf093fb),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Interests Section using ModernCard and InterestChip
                  ModernCard(
                    icon: Icons.star_outline,
                    iconColor: Color(0xFFFFB800),
                    title: 'Interests & Skills',
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        'Beginner',
                        'Fluent',
                        'Writing',
                        'Reading',
                        'Speaking'
                      ]
                          .map((interest) => InterestChip(text: interest))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Purchases Section using ModernCard and PurchaseCard
                  ModernCard(
                    icon: Icons.shopping_bag_outlined,
                    iconColor: Color(0xFFFF6B9D),
                    title: 'My Collection',
                    child: Column(
                      children: [
                        PurchaseCard(
                          title: 'Background Theme',
                          category: 'background',
                          price: '10 coins',
                          icon: Icons.wallpaper,
                          isPaid: true,
                        ),
                        SizedBox(height: 12),
                        PurchaseCard(
                          title: 'Profile Frame',
                          category: 'user_frame',
                          price: 'Free',
                          icon: Icons.person,
                          isPaid: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // VIP Premium Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFFFD700),
                          Color(0xFFFFB800),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFFB800).withOpacity(0.4),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.diamond,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        Blacktext(
                          text: 'Become a VIP Member',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Blacktext(
                          text: 'Unlock exclusive features & premium benefits',
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: 'Upgrade Now',
                          color: Colors.white,
                          textColor: Color(0xFFFFB800),
                          fontWeight: FontWeight.bold,
                          icon: Icon(Icons.arrow_forward,
                              size: 20, color: Color(0xFFFFB800)),
                          onPressed: () {},
                          width: double.infinity,
                          height: 54,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
