import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'seller_screen.dart';
import 'seller_historique.dart';
import 'profile_screen.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  static const Color _deepPurple = Color(0xFF5A3C83);
  static const Color _softPurple = Color(0xFF8E6BBF);
  static const Color _lightPurple = Color(0xFFE6E0F3);
  static const Color _white = Color(0xFFFFEDEC);
  static const Color _darkText = Color(0xFF2D2D2D);
  static const Color _greyText = Color(0xFF6D6D6D);
  static const Color _pwhite = Color(0xFFFAF5FF);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _characteristicsController = TextEditingController();
  final TextEditingController _careInstructionsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF5A3C83),
      statusBarIconBrightness: Brightness.light,
    ));
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: TextStyle(color: _darkText),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: _softPurple),
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _lightPurple.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _lightPurple.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _softPurple, width: 2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5A3C83),
                  Color(0xFF6A4C93),
                  Color(0xFFB399D4),
                  Color(0xFFDCC6F0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.3, 0.7, 1.0],
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: Image.asset(
                "assets/images/font.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 80),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
  height: 120,  // Matches your reference height
  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    image: DecorationImage(
      image: AssetImage("assets/images/font.jpg"),
      fit: BoxFit.cover,
      opacity: 0.4,  // Matches your reference opacity
    ),
    boxShadow: [
      BoxShadow(
        color: _deepPurple.withOpacity(0.2),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  margin: const EdgeInsets.only(bottom: 20),  // Keeps original bottom margin
  child: Center(
    child: Text(
      'Create New Flower',  // Original text maintained
      style: TextStyle(
        fontFamily: 'Great Vibes',
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: _deepPurple,  // Changed to deepPurple to match original
        shadows: [
          Shadow(
            color: Colors.white.withOpacity(0.4),  // Matches original shadow
            blurRadius: 8,  // Matches original blur
            offset: const Offset(2, 2),  // Matches original offset
          ),
        ],
      ),
    ),
  ),
),
                _buildFormField(
                  controller: _nameController,
                  label: 'Name',
                  hint: 'Enter flower name',
                  icon: Icons.local_florist,
                ),
                const SizedBox(height: 15),
                _buildFormField(
                  controller: _priceController,
                  label: 'Price',
                  hint: 'Enter price (e.g., \$25.00)',
                  icon: Icons.attach_money,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                _buildFormField(
                  controller: _characteristicsController,
                  label: 'Characteristics',
                  hint: 'Enter flower characteristics',
                  icon: Icons.description,
                  maxLines: 3,
                ),
                const SizedBox(height: 15),
                _buildFormField(
                  controller: _careInstructionsController,
                  label: 'Care Instructions',
                  hint: 'How to take care of this flower',
                  icon: Icons.eco,
                  maxLines: 4,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {},
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
                        Icon(Icons.camera_alt_outlined, color: _deepPurple, size: 18),
                        const SizedBox(width: 10),
                        Text(
                          'Upload Flower Image',
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
                const SizedBox(height: 30),
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
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const SellerScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        alignment: Alignment.center,
                        child: const Text(
                          'CREATE ITEM',
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
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [_deepPurple, _softPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: _deepPurple.withOpacity(0.3),
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add_rounded, size: 28, color: Colors.white),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: _deepPurple,
            unselectedItemColor: _greyText,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'Lora',
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Lora',
              fontWeight: FontWeight.w400,
              fontSize: 11,
            ),
            type: BottomNavigationBarType.fixed,
            currentIndex: 1,
            onTap: (index) {
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SellerScreen()),
                );
              } else if (index == 1) {
                // Already on NewItemScreen
              } else if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoriqueScreen()),
                );
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.store_rounded, size: 24),
                ),
                label: 'Listings',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.add_rounded, size: 24),
                ),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.history_rounded, size: 24),
                ),
                label: 'History',
              ),
            ],
          ),
        ),
      ),
    );
  }
}