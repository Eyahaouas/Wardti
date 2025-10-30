import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  static const Color _deepPurple = Color(0xFF5A3C83);
  static const Color _softPurple = Color(0xFF8E6BBF);
  static const Color _lightPurple = Color(0xFFE6E0F3);
  static const Color _white = Color(0xFFffedec);
  static const Color _darkText = Color(0xFF2D2D2D);
  static const Color _greyText = Color(0xFF6D6D6D);
  static const Color _pwhite = Color(0xFFFAF5FF);
  static const Color _softSalmon = Color(0xFFFDEEE7);
  static const Color _navShade = Color(0xFFF7F3FB);

  final TextEditingController _nameController = TextEditingController(text: "Eya HAOUAS");
  final TextEditingController _emailController = TextEditingController(text: "eya.haouas@email.com");
  final TextEditingController _phoneController = TextEditingController(text: "+216 99 795 127");
  final TextEditingController _addressController = TextEditingController(text: "Sousse, Tunisia");

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

          // Main content with scrollable white container
          Column(
            children: [
              // This spacer pushes the white container down to create space for the profile image
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              
              // White container with fixed and scrollable content
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
                        // Fixed section (140px height to match ProfilePage)
                        Container(
                          height: 140,
                          padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
                          child: Column(
                            children: [
                              // Title
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontFamily: 'Lora',
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: _darkText,
                                ),
                              ),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                        // Scrollable section
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              child: Column(
                                children: [
                                  // Edit profile photo button
                                  GestureDetector(
                                    onTap: () {
                                      // Handle photo change
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: _lightPurple.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: _lightPurple.withOpacity(0.5), width: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: _deepPurple.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Icon(
                                              Icons.camera_alt_outlined,
                                              color: _deepPurple,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Change Profile Photo',
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
                                  ),
                                  const SizedBox(height: 25),
                                  
                                  // Edit form fields
                                  _buildEditField(
                                    controller: _nameController,
                                    icon: Icons.person_outlined,
                                    title: "Full Name",
                                    hint: "Enter your full name",
                                  ),
                                  const SizedBox(height: 15),
                                  _buildEditField(
                                    controller: _emailController,
                                    icon: Icons.email_outlined,
                                    title: "Email",
                                    hint: "Enter your email",
                                  ),
                                  const SizedBox(height: 15),
                                  _buildEditField(
                                    controller: _phoneController,
                                    icon: Icons.phone_outlined,
                                    title: "Phone Number",
                                    hint: "Enter your phone number",
                                  ),
                                  const SizedBox(height: 15),
                                  _buildEditField(
                                    controller: _addressController,
                                    icon: Icons.location_on_outlined,
                                    title: "Address",
                                    hint: "Enter your address",
                                  ),
                                  
                                  const SizedBox(height: 30),
                                  
                                  // Save changes button
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: const LinearGradient(
                                        colors: [_deepPurple, _softPurple],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: _deepPurple.withOpacity(0.4),
                                          blurRadius: 20,
                                          spreadRadius: 8,
                                          offset: const Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(12),
                                        onTap: () {
                                          // Handle save
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 56,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'SAVE CHANGES',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
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

          // User profile photo with proper frame
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25 - 70, // Adjusted to match ProfilePage
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
                    // User photo - positioned behind the frame
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image.asset(
                        "assets/images/me.jpg",
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Frame image - positioned on top to frame the photo
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

  Widget _buildEditField({
    required TextEditingController controller,
    required IconData icon,
    required String title,
    required String hint,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _lightPurple.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: _lightPurple.withOpacity(0.5), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _darkText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            style: TextStyle(
              fontFamily: 'Lora',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: _darkText,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontFamily: 'Lora',
                fontSize: 14,
                color: _greyText.withOpacity(0.7),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: _deepPurple,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}