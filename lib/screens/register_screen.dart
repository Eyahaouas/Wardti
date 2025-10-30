import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Same color palette as LoginScreen
  static const Color _deepPurple = Color(0xFF6A4C93);
  static const Color _softPurple = Color(0xFFB399D4);
  static const Color _lightPurple = Color(0xFFE6E0F3);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _darkText = Color(0xFF2D2D2D);
  static const Color _greyText = Color(0xFF6D6D6D);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool _acceptTerms = false;

  @override
  void initState() {
    super.initState();
    // Set status bar color to match LoginScreen
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF3A2556),
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Fullscreen gradient background (fixed)
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
                BoxShadow(
                  color: _deepPurple.withOpacity(0.3),
                  blurRadius: 56,
                  spreadRadius: 16,
                  offset: const Offset(0, 24),
                ),
                BoxShadow(
                  color: _softPurple.withOpacity(0.15),
                  blurRadius: 84,
                  spreadRadius: 20,
                  offset: const Offset(0, 36),
                ),
              ],
            ),
          ),
          
          // Rose image (fixed)
          Positioned(
            top: -90,
            left: -90,
            child: Image.asset(
              'assets/images/rose.png',
              width: 250,
              height: 250,
            ),
          ),

          // Inputs container (fixed)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.30,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * 0.30),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF3EBFF), // Updated to light purple
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 
                        (MediaQuery.of(context).size.height * 0.30) - 
                        MediaQuery.of(context).padding.top,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        // Name Field
                        _buildInputField(
                          controller: _nameController,
                          label: 'FULL NAME',
                          hint: 'Enter your name',
                          icon: Icons.person_outline,
                        ),
                        const SizedBox(height: 16),
                        // Email Field
                        _buildInputField(
                          controller: _emailController,
                          label: 'EMAIL ADDRESS',
                          hint: 'enter@your.email',
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 16),
                        // Password Field
                        _buildInputField(
                          controller: _passwordController,
                          label: 'PASSWORD',
                          hint: '••••••••',
                          icon: Icons.lock_outlined,
                          isPassword: true,
                          showPassword: _showPassword,
                          onTogglePassword: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        // Confirm Password Field
                        _buildInputField(
                          controller: _confirmPasswordController,
                          label: 'CONFIRM PASSWORD',
                          hint: '••••••••',
                          icon: Icons.lock_outlined,
                          isPassword: true,
                          showPassword: _showConfirmPassword,
                          onTogglePassword: () {
                            setState(() {
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        // Terms and Conditions
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.0,
                              child: Checkbox(
                                value: _acceptTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _acceptTerms = value!;
                                  });
                                },
                                activeColor: _deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'I agree to the ',
                                  style: TextStyle(
                                    color: _greyText,
                                    fontSize: 15,
                                    fontFamily: 'Roboto',
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: TextStyle(
                                        color: _deepPurple,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    const TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: _deepPurple,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Register button
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
                              BoxShadow(
                                color: _deepPurple.withOpacity(0.2),
                                blurRadius: 40,
                                spreadRadius: 10,
                                offset: const Offset(0, 16),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: _handleRegister,
                              child: Container(
                                width: double.infinity,
                                height: 56,
                                alignment: Alignment.center,
                                child: const Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    color: _white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Divider
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: _greyText.withOpacity(0.3),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  color: _greyText,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: _greyText.withOpacity(0.3),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Sign In link
                        RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              color: _greyText,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  color: _deepPurple,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Brand name (fixed)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.30 - 140,
            right: 178,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Wardti',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Dancing',
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Your favorite fleuriste',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Dancing',
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Butterfly logo (fixed)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.30 - 80,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/butterfly.png',
                width: 160,
                height: 160,
              ),
            ),
          ),

          // Back button (fixed)
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: _white, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool showPassword = false,
    VoidCallback? onTogglePassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: _darkText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: _lightPurple.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword && !showPassword,
            style: TextStyle(
              color: _darkText,
              fontSize: 18,
              fontFamily: 'Roboto',
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: _greyText.withOpacity(0.6),
                fontSize: 16,
                fontFamily: 'Roboto',
              ),
              filled: true,
              fillColor: _white,
              prefixIcon: Icon(
                icon,
                color: _deepPurple,
                size: 26,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        showPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: _greyText.withOpacity(0.6),
                        size: 26,
                      ),
                      onPressed: onTogglePassword,
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: _deepPurple,
                  width: 1.5,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handleRegister() {
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the terms and conditions')),
      );
      return;
    }
    
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }
    
    // Successful registration - navigate to login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}