import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';
import 'fav_screen.dart';
import 'profile_screen.dart';
import 'item_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  static const Color _deepPurple = Color(0xFF5A3C83);
  static const Color _softPurple = Color(0xFF8E6BBF);
  static const Color _lightPurple = Color(0xFFE6E0F3);
  static const Color _white = Color(0xFFffedec);
  static const Color _darkText = Color(0xFF2D2D2D);
  static const Color _greyText = Color(0xFF6D6D6D);
  static const Color _pwhite = Color(0xFFFAF5FF);
  static const Color _softSalmon = Color(0xFFFDEEE7);
  static const Color _navShade = Color(0xFFF7F3FB);

  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Rose Bouquet White',
      'price': '10 dt',
      'originalPrice': '15 dt',
      'image': 'assets/images/rose2.jpg',
      'characteristics': 'Elegant white roses, perfect for occasions.',
      'quantity': 1,
    },
    {
      'name': 'Rose Bouquet White',
      'price': '10 dt',
      'originalPrice': '15 dt',
      'image': 'assets/images/tops.jpg',
      'characteristics': 'Elegant garden bouquet.',
      'quantity': 1,
    },
    {
      'name': 'Flowers Bouquet Pink',
      'price': '8 dt',
      'originalPrice': '10 dt',
      'image': 'assets/images/rose4.jpg',
      'characteristics': 'Vibrant pink blooms, spring collection.',
      'quantity': 1,
    },
  ];

  final List<Map<String, dynamic>> examplePosts = [
    {
      'name': 'Recent Rose Bouquet',
      'image': 'assets/images/rose4.jpg',
      'price': '4 dt',
      'originalPrice': '6 dt',
      'characteristics': 'Similar to your usual rose posts.',
      'liked': false,
    },
    {
      'name': 'Trending Daisies',
      'image': 'assets/images/rose3.jpg',
      'price': '6 dt',
      'originalPrice': '8 dt',
      'characteristics': 'Popular choice this week.',
      'liked': false,
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

  double _calculateSubtotal() {
    double subtotal = 0.0;
    for (var item in cartItems) {
      if (item['price'] != null) {
        final price = double.tryParse(item['price']!.replaceAll(' dt', '').trim()) ?? 0.0;
        final quantity = (item['quantity'] as int?) ?? 1;
        subtotal += price * quantity;
      }
    }
    return subtotal;
  }

  void _updateQuantity(int index, int delta) {
    setState(() {
      final newQuantity = ((cartItems[index]['quantity'] as int?) ?? 1) + delta;
      if (newQuantity >= 1) {
        cartItems[index]['quantity'] = newQuantity;
      } else {
        final itemName = cartItems[index]['name'] ?? 'Item';
        cartItems.removeAt(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$itemName removed from cart'),
            backgroundColor: Colors.redAccent,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    });
  }

  void _addToCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.add({...item, 'quantity': 1});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${item['name'] ?? 'Item'} added to cart 🛒'),
          backgroundColor: _deepPurple,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      examplePosts[index]['liked'] = !(examplePosts[index]['liked'] as bool? ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                _buildAppHeader(),
                const SizedBox(height: 50),
                _buildSectionTitle('Your Cart'),
                const SizedBox(height: 15),
                cartItems.isEmpty
                    ? _buildEmptyCart()
                    : _buildCartItemsList(),
                const SizedBox(height: 30),
                _buildSectionTitle('Cart Total'),
                const SizedBox(height: 20),
                _buildCartTotalBanner(),
                const SizedBox(height: 30),
                _buildSectionTitle('You Might Also Like'),
                const SizedBox(height: 15),
                _buildExamplePostsList(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF352452),
            Color(0xFF4D3575),
            Color(0xFF7A5A9D),
            Color(0xFFDCC6F0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.3, 0.7, 1.0],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
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
                MaterialPageRoute(builder: (context) => const HomeScreen()),
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
    );
  }

  Widget _buildSectionTitle(String title, {bool large = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Lora',
          color: _white,
          fontSize: large ? 26 : 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildAppHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wardti',
                style: TextStyle(
                  color: _white,
                  fontSize: 55,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Dancing',
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                'Your favorite fleuriste',
                style: TextStyle(
                  fontFamily: 'David Libre',
                  fontStyle: FontStyle.italic,
                  color: _white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _softSalmon,
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/me.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 80,
              color: _greyText.withOpacity(0.7),
            ),
            const SizedBox(height: 16),
            Text(
              'Your cart is empty',
              style: TextStyle(
                color: _greyText,
                fontSize: 18,
                fontFamily: 'Lora',
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItemsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: _white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(12),
                ),
                child: SizedBox(
                  width: 100,
                  height: 120,
                  child: Image.asset(
                    item['image'] ?? 'assets/images/placeholder.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name'] ?? 'Unknown Item'),
                      Row(
                        children: [
                          Text(item['price'] ?? '0 dt'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: _navShade,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove, size: 16, color: _deepPurple),
                                  onPressed: () => _updateQuantity(index, -1),
                                ),
                                Text('${item['quantity'] ?? 1}'),
                                IconButton(
                                  icon: Icon(Icons.add, size: 16, color: _deepPurple),
                                  onPressed: () => _updateQuantity(index, 1),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${((double.tryParse(item['price']!.replaceAll(' dt', '').trim()) ?? 0.0) * ((item['quantity'] as int?) ?? 1))} DT',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCartTotalBanner() {
    final subtotal = _calculateSubtotal();
    const deliveryFee = 5.0;
    final total = subtotal + deliveryFee;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: _white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPriceRow('Subtotal', '${subtotal.toStringAsFixed(2)} DT'),
            _buildPriceRow('Delivery', '${deliveryFee.toStringAsFixed(2)} DT'),
            const Divider(thickness: 1),
            _buildPriceRow('Total', '${total.toStringAsFixed(2)} DT', bold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Lora',
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
              fontSize: bold ? 16 : 14,
              color: _darkText,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Lora',
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
              fontSize: bold ? 16 : 14,
              color: _deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExamplePostsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 230,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: examplePosts.length,
          itemBuilder: (context, index) {
            final post = examplePosts[index];
            return Container(
              width: 160,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: _white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          post['image'] ?? 'assets/images/placeholder.jpg',
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                post['liked'] == true ? Icons.favorite : Icons.favorite_border,
                                color: _deepPurple,
                              ),
                              onPressed: () => _toggleFavorite(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_shopping_cart, color: _deepPurple),
                              onPressed: () => _addToCart(post),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post['name'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: _darkText,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          post['price'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.w700,
                            color: _deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
