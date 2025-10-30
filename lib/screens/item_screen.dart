import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'fav_screen.dart';

class ItemScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const ItemScreen({super.key, required this.item});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  static const Color _deepPurple = Color(0xFF5A3C83);
  static const Color _softPurple = Color(0xFF8E6BBF);
  static const Color _lightPurple = Color(0xFFE6E0F3);
  static const Color _white = Color(0xFFffedec);
  static const Color _darkText = Color(0xFF2D2D2D);
  static const Color _greyText = Color(0xFF6D6D6D);
  static const Color _pwhite = Color(0xFFFAF5FF);
  static const Color _softSalmon = Color(0xFFFDEEE7);
  static const Color _navShade = Color(0xFFF7F3FB);

  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF5A3C83),
      statusBarIconBrightness: Brightness.light,
    ));
    _isFavorite = widget.item['liked'] ?? false;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      widget.item['liked'] = _isFavorite;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              _isFavorite
                  ? '${widget.item['name']} added to favorites'
                  : '${widget.item['name']} removed from favorites'),
          backgroundColor: _deepPurple,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    });
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.item['name']} added to cart 🛒'),
        backgroundColor: _deepPurple,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _contactSeller() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Contacting seller...'),
        backgroundColor: _deepPurple,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
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
                'assets/images/font.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacer for title
                const SizedBox(height: 60),
                // Title
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: _deepPurple.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.15,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/font.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Flower Details',
                          style: TextStyle(
                            fontFamily: 'Great Vibes',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: _pwhite,
                            shadows: [
                              Shadow(
                                color: _deepPurple.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Item details
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _lightPurple.withOpacity(0.5),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _deepPurple.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                widget.item['image'],
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          widget.item['name'],
                                          style: TextStyle(
                                            fontFamily: 'Playfair Display',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: _deepPurple,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: _toggleFavorite,
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _lightPurple.withOpacity(0.3),
                                          ),
                                          child: Icon(
                                            _isFavorite ? Icons.favorite : Icons.favorite_border,
                                            color: _isFavorite ? Colors.red : _greyText,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        widget.item['price'],
                                        style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: _deepPurple,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        widget.item['originalPrice'] ?? '',
                                        style: TextStyle(
                                          fontFamily: 'Lora',
                                          fontSize: 12,
                                          color: _greyText,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    widget.item['characteristics'],
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 14,
                                      color: _greyText,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'How to Take Care of Your Flowers',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: _deepPurple,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Keep in a cool place away from direct sunlight. Change the water every 2 days and trim stems at an angle. Add flower food to the water to extend freshness.',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 14,
                                      color: _greyText,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Seller Information',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: _deepPurple,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Name: Flora Boutique\nLocation: Sousse, Tunisia\nEmail: contact@floraboutique.com\nPhone: +216 12 345 678',
                                    style: TextStyle(
                                      fontFamily: 'Lora',
                                      fontSize: 14,
                                      color: _greyText,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
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
                                        onTap: _contactSeller,
                                        child: Container(
                                          width: double.infinity,
                                          height: 48,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'CONTACT SELLER',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
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
                                        onTap: _addToCart,
                                        child: Container(
                                          width: double.infinity,
                                          height: 48,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'ADD TO CART',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
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
                        // Frame overlay
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/frame2.png',
                              fit: BoxFit.cover,
                              opacity: const AlwaysStoppedAnimation(0.1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
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
          child: const Icon(Icons.shopping_cart_rounded, size: 26, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
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
            currentIndex: 0, // No specific tab selected
            onTap: (index) {
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              } else if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              } else if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoritesScreen()),
                );
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.home_rounded, size: 24),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.shopping_cart_rounded, size: 24),
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.favorite_rounded, size: 24),
                ),
                label: 'Favorites',
              ),
            ],
          ),
        ),
      ),
    );
  }
}