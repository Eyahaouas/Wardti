import 'package:flutter/material.dart';
import 'edit_profile_screen.dart'; // Import the edit profile screen
import 'login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const Color _deepPurple = Color(0xFF5A3C83);
  static const Color _softPurple = Color(0xFF8E6BBF);
  static const Color _lightPurple = Color(0xFFE6E0F3);
  static const Color _white = Color(0xFFffedec);
  static const Color _darkText = Color(0xFF2D2D2D);
  static const Color _greyText = Color(0xFF6D6D6D);
  static const Color _pwhite = Color(0xFFFAF5FF);
  static const Color _softSalmon = Color(0xFFFDEEE7);
  static const Color _navShade = Color(0xFFF7F3FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen gradient background with enhanced 3D shadow effect
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF5A3C83),
                  Color(0xFF6A4C93),
                  Color(0xFFB399D4),
                  Color(0xFFDCC6F0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.3, 0.7, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: _deepPurple.withOpacity(0.5),
                  blurRadius: 28,
                  spreadRadius: 12,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
          ),

          // Low opacity background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: Image.asset(
                "assets/images/font.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Back button
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
              ),
            ),
          ),

          // Main content with scrollable white container
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3EBFF),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _deepPurple.withOpacity(0.35),
                        blurRadius: 16,
                        spreadRadius: 5,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
                          child: Column(
                            children: [
                              Text(
                                "Eya HAOUAS",
                                style: TextStyle(
                                  fontFamily: 'Dancing Script',
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: _darkText,
                                  letterSpacing: 1.3,
                                ),
                              ),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              child: Column(
                                children: [
                                  _buildInfoContainer(
                                    icon: Icons.email_outlined,
                                    title: "Email",
                                    value: "example@email.com",
                                  ),
                                  _buildInfoContainer(
                                    icon: Icons.phone_outlined,
                                    title: "Phone Number",
                                    value: "+216 XXX XXX XXX",
                                  ),
                                  const SizedBox(height: 15),
                                  _buildInfoContainer(
                                    icon: Icons.location_on_outlined,
                                    title: "Address",
                                    value: "Sousse, Tunisia",
                                  ),
                                  const SizedBox(height: 15),
                                  _buildInfoContainer(
                                    icon: Icons.calendar_today_outlined,
                                    title: "Member Since",
                                    value: "January 2024",
                                  ),
                                  const SizedBox(height: 15),
                                  _buildInfoContainer(
                                    icon: Icons.star_outline,
                                    title: "Points",
                                    value: "1500 ⭐",
                                  ),
                                  const SizedBox(height: 30),
                                  _buildModernButton(
                                    icon: Icons.history_rounded,
                                    text: "PURCHASE HISTORY",
                                    onPressed: () {},
                                    color: _softPurple,
                                  ),
                                  const SizedBox(height: 15),
                                  _buildModernButton(
                                    icon: Icons.edit_rounded,
                                    text: "EDIT PROFILE",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const EditProfileScreen(),
                                        ),
                                      );
                                    },
                                    color: _deepPurple,
                                  ),
                                  const SizedBox(height: 15),
                                  _buildModernButton(
                                    icon: Icons.logout_rounded,
                                    text: "LOGOUT",
                                    onPressed: () {
                                      _showLogoutConfirmation(context);
                                    },
                                    color: Colors.redAccent,
                                    isDestructive: true,
                                  ),
                                  const SizedBox(height: 20),

                                  // Contact Help Center Link
                                  GestureDetector(
                                    onTap: () {
                                      // Action here
                                    },
                                    child: Text(
                                      "Contact Help Center",
                                      style: TextStyle(
                                        fontFamily: 'Lora',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: _deepPurple,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // User profile photo
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25 - 70,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image.asset(
                        "assets/images/me.jpg",
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Image.asset(
                      "assets/images/pframe.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Logout", style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Logout", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildModernButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
    required Color color,
    bool isDestructive = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: isDestructive
              ? [Colors.redAccent, Colors.red.shade700]
              : [color, Color.lerp(color, Colors.black, 0.1)!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          splashColor: Colors.white.withOpacity(0.2),
          highlightColor: Colors.white.withOpacity(0.1),
          child: Container(
            width: double.infinity,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 22),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContainer({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _lightPurple.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: _lightPurple.withOpacity(0.5), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _deepPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: _deepPurple,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: _greyText,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _darkText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
