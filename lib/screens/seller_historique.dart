import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'new_item_screen.dart';
import 'seller_screen.dart';

class HistoriqueScreen extends StatefulWidget {
  const HistoriqueScreen({super.key});

  @override
  State<HistoriqueScreen> createState() => _HistoriqueScreenState();
}

class _HistoriqueScreenState extends State<HistoriqueScreen> {
  static const Color _deepPurple = Color(0xFF5A3C83);
  static const Color _softPurple = Color(0xFF8E6BBF);
  static const Color _lightPurple = Color(0xFFE6E0F3);
  static const Color _white = Color(0xFFffedec);
  static const Color _darkText = Color(0xFF2D2D2D);
  static const Color _greyText = Color(0xFF6D6D6D);
  static const Color _pwhite = Color(0xFFFAF5FF);
  static const Color _navShade = Color(0xFFF7F3FB);

  final List<Map<String, dynamic>> soldFlowers = [
    {
      'name': 'Red Roses Bouquet',
      'image': 'assets/images/rose2.jpg',
      'price': '\$30.00',
      'originalPrice': '\$35.00',
      'characteristics': 'Classic red blooms, symbol of love.',
      'sold': true,
      'saleDate': '2025-08-15',
      'quantity': 2,
    },
    {
      'name': 'Orchid Arrangement',
      'image': 'assets/images/rose5.jpg',
      'price': '\$45.00',
      'originalPrice': '\$50.00',
      'characteristics': 'Exotic purple hues, luxurious look.',
      'sold': true,
      'saleDate': '2025-08-14',
      'quantity': 1,
    },
    {
      'name': 'White Lily Bundle',
      'image': 'assets/images/rose1.jpg',
      'price': '\$25.00',
      'originalPrice': '\$30.00',
      'characteristics': 'Elegant white petals, perfect for weddings.',
      'sold': true,
      'saleDate': '2025-08-12',
      'quantity': 3,
    },
    {
      'name': 'Sunflower Collection',
      'image': 'assets/images/rose3.jpg',
      'price': '\$28.00',
      'originalPrice': '\$32.00',
      'characteristics': 'Bright yellow petals, cheerful vibe.',
      'sold': true,
      'saleDate': '2025-08-10',
      'quantity': 2,
    },
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF5A3C83),
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
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
          // Main content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                // Lighter title container
                Container(
  height: 120,  // Explicit height for better control
  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    image: DecorationImage(
      image: AssetImage("assets/images/font.jpg"),
      fit: BoxFit.cover,
      opacity: 0.4,  // Adjust opacity as needed (0.0 to 1.0)
    ),
    boxShadow: [
      BoxShadow(
        color: _deepPurple.withOpacity(0.2),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  margin: const EdgeInsets.symmetric(horizontal: 20),
  child: Center(
    child: Text(
      'Sale History',
      style: TextStyle(
        fontFamily: 'Great Vibes',
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: _pwhite,
        shadows: [
          Shadow(  // Added shadow for better text visibility
            blurRadius: 4,
            color: _deepPurple.withOpacity(0.6),
            offset: Offset(1, 1),
          ),
        ],
      ),
    ),
  ),
),
                const SizedBox(height: 20),
                // Sale items grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: soldFlowers.length,
                    itemBuilder: (context, index) {
                      final flower = soldFlowers[index];
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: _white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: _deepPurple.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Image section
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: Image.asset(
                                    flower['image'],
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // Content section
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              flower['name'],
                                              style: TextStyle(
                                                fontFamily: 'Playfair Display',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: _deepPurple,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 6),
                                            Row(
                                              children: [
                                                Text(
                                                  flower['price'],
                                                  style: TextStyle(
                                                    fontFamily: 'Lora',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: _deepPurple,
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  flower['originalPrice'],
                                                  style: TextStyle(
                                                    fontFamily: 'Lora',
                                                    fontSize: 12,
                                                    color: _greyText,
                                                    decoration: TextDecoration.lineThrough,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              flower['characteristics'],
                                              style: TextStyle(
                                                fontFamily: 'Lora',
                                                fontSize: 12,
                                                color: _greyText,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Sold: ${flower['saleDate']}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lora',
                                                    fontSize: 10,
                                                    color: _greyText,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                                Text(
                                                  'Qty: ${flower['quantity']}',
                                                  style: TextStyle(
                                                    fontFamily: 'Lora',
                                                    fontSize: 12,
                                                    color: _deepPurple,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Sold badge - now properly positioned
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Sold',
                                style: TextStyle(
                                  fontFamily: 'Lora',
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 80),
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
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add_rounded, size: 26, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewItemScreen()),
            );
          },
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
            currentIndex: 2,
            onTap: (index) {
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SellerScreen()),
                );
              } else if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NewItemScreen()),
                );
              }
              // index == 2 is current screen
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