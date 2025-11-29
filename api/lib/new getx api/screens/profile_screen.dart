import 'package:api/new getx api/components/common_widgets/spinner.dart';
import 'package:api/new getx api/controllers/profile_controller.dart';
import 'package:api/new getx api/services/get-storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../src/controller/components/black-text.dart';
import '../components/common_widgets/custom_button.dart';
import '../components/common_widgets/profile_header_badge.dart';
import '../components/common_widgets/stat_card.dart';
import '../components/common_widgets/modern_card.dart';
import '../components/common_widgets/language_item.dart';
import '../components/common_widgets/interest_chip.dart';
import '../components/common_widgets/purchase_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();

    final token = GetStorageService.getToken();
    final userid = GetStorageService.getUserId().toString();

    if (token != null) {
      profileController.fetchProfileData("93", token);
    } else {
      print("TOKEN NOT FOUND");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: Obx(() {
        if (profileController.isLoading.value) {
          return Center(child: Spinner());
        }

        final data = profileController.profileData;

        return CustomScrollView(
          slivers: [
            // HEADER
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

                    // DECORATIVE CIRCLES
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

                    // PROFILE
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          // PROFILE IMAGE
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
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  child: data['profile_image_url'] != null
                                      ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        data['profile_image_url']),
                                  )
                                      : CircleAvatar(
                                    radius: 50,
                                    child: Icon(Icons.person, size: 50),
                                  ),
                                ),

                                // CAMERA ICON
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

                          // NAME
                          Blacktext(
                            text: data['profile']?['nickname'] ?? "N/A",
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),

                          SizedBox(height: 6),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 🔥 FIX #1
                              ProfileHeaderBadge(
                                icon: Icons.male,
                                text: data['profile']?['gender']?.toString() ??
                                    "N/A",
                              ),

                              SizedBox(width: 8),

                              // 🔥 FIX #2
                              ProfileHeaderBadge(
                                icon: Icons.cake,
                                text: data['profile']?['age']?.toString() ??
                                    "N/A",
                              ),

                              SizedBox(width: 8),

                              // 🔥 FIX #3
                              ProfileHeaderBadge(
                                icon: Icons.location_on,
                                text:
                                data['profile']?['location'] ?? "N/A",
                              ),
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

            // BODY CONTENT
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    // STATS CARD
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
                            count: data['followers'].toString(),
                            label: 'Followers',
                            color: Color(0xFF667eea),
                          ),
                          Container(
                              width: 1,
                              height: 50,
                              color: Colors.grey[200]),
                          StatCard(
                            count: data['following'].toString(),
                            label: 'Following',
                            color: Color(0xFF764ba2),
                          ),
                          Container(
                              width: 1,
                              height: 50,
                              color: Colors.grey[200]),
                          StatCard(
                            count: data['visitors'].toString(),
                            label: 'Visitors',
                            color: Color(0xFFf093fb),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

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

                    ModernCard(
                      icon: Icons.info_outline,
                      iconColor: Color(0xFF667eea),
                      title: 'About Me',
                      child: Blacktext(
                        text: data['profile']['bio']??"N/A",
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),

                    SizedBox(height: 16),

                    ModernCard(
                      icon: Icons.language,
                      iconColor: Color(0xFF56ab2f),
                      title: 'Languages',
                      child: Column(
                        children: [
                          // Speaking Languages
                          LanguageItem(
                            label: 'Speaking',
                            languages: List<String>.from(data['profile']['spoken_languages'] ?? []),
                            color: Color(0xFF667eea),
                          ),
                          SizedBox(height: 12),
                          Divider(height: 1),
                          SizedBox(height: 12),
                          // Learning Languages
                          LanguageItem(
                            label: 'Learning',
                            languages: List<String>.from(data['profile']['learning_languages'] ?? []),
                            color: Color(0xFFf093fb),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                ModernCard(
                  icon: Icons.star_outline,
                  iconColor: Color(0xFFFFB800),
                  title: 'Interests & Skills',
                  child: data['profile']['interests'] == null ||
                      (data['profile']['interests'] as List).isEmpty
                      ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("No interests added yet", style: TextStyle(color: Colors.grey)),
                    ),
                  )
                      : Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: (data['profile']['interests'] as List)
                        .map((interest) => InterestChip(text: interest.toString()))
                        .toList(),
                  ),
                ),

                    SizedBox(height: 16),

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
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.diamond,
                                size: 40, color: Colors.white),
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
                            text:
                            'Unlock exclusive features & premium benefits',
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
            )
          ],
        );
      }),
    );
  }
}
