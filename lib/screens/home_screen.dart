import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'new_arrivals_page.dart';
import 'profile_screen.dart';
import 'fav_screen.dart';
import 'cart_screen.dart';
import 'item_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color _deepPurple = Color(0xFF5A3C83);
  static const Color _softPurple = Color(0xFF8E6BBF);
  static const Color _lightPurple = Color(0xFFE6E0F3);
  static const Color _white = Color(0xFFffedec);
  static const Color _darkText = Color(0xFF2D2D2D);
  static const Color _greyText = Color(0xFF6D6D6D);
  static const Color _pwhite = Color(0xFFFAF5FF);
  static const Color _softSalmon = Color(0xFFFDEEE7);
  static const Color _navShade = Color(0xFFF7F3FB);

  static const List<Map<String, String>> _categories = [
    {'name': 'Duffcell', 'image': 'assets/images/rose1.jpg'},
    {'name': 'Dallas', 'image': 'assets/images/rose2.jpg'},
    {'name': 'Rose', 'image': 'assets/images/rose3.jpg'},
    {'name': 'Jaramie', 'image': 'assets/images/rose4.jpg'},
  ];

  static const List<Map<String, String>> _topSellers = [
    {'name': 'Bouston bouquet flower', 'price': '\ 5 dt', 'originalPrice': '\ 7 dt', 'image': 'assets/images/rose1.jpg'},
    {'name': 'Rose bouquet white', 'price': '\ 5 dt', 'originalPrice': '\ 7 dt', 'image': 'assets/images/rose2.jpg'},
    {'name': 'Hyperthi white stick', 'price': '\ 5 dt', 'originalPrice': '\ 7 dt', 'image': 'assets/images/rose3.jpg'},
    {'name': 'Flowers bouquet pink', 'price': '\ 5 dt', 'originalPrice': '\ 7 dt', 'image': 'assets/images/rose4.jpg'},
    {'name': 'Bouquet garden', 'price': '\ 5 dt', 'originalPrice': '\ 7 dt', 'image': 'assets/images/tops.jpg'},
  ];

  // Track favorite items
  Set<int> _favoriteItems = <int>{};

  void _toggleFavorite(int index) {
    setState(() {
      if (_favoriteItems.contains(index)) {
        _favoriteItems.remove(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${_topSellers[index]['name']} removed from favorites'),
            backgroundColor: Colors.redAccent,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      } else {
        _favoriteItems.add(index);
        HapticFeedback.lightImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${_topSellers[index]['name']} added to favorites ❤️'),
            backgroundColor: _deepPurple,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }
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
                const SizedBox(height: 20),
                _buildChatbotBanner(), // Added chatbot banner
                const SizedBox(height: 20),
                _buildSectionTitle('Flower Category'),
                const SizedBox(height: 20),
                _buildCategoryGrid(),
                const SizedBox(height: 30),
                _buildNewArrivalsBanner(context),
                const SizedBox(height: 30),
                _buildSpecialFlowers(),
                const SizedBox(height: 30),
                _buildSectionTitle('Top sellers'),
                const SizedBox(height: 15),
                _buildTopSellersGrid(),
                const SizedBox(height: 30),
                _buildSectionTitle('Our Flower Colors'),
                const SizedBox(height: 0),
                _buildTopTulipList(),
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
            currentIndex: 0,
            onTap: (index) {
              if (index == 0) {
                // Already on HomeScreen
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              } else if (index == 2) {
                Navigator.push(
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

  Widget _buildAppHeader() {
    return Builder(
      builder: (context) {
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
                    'Your floral marketplace',
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
                      color: const Color(0xFFFDEEE7),
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
      },
    );
  }

  Widget _buildChatbotBanner() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Chatbot coming soon!'),
            backgroundColor: _deepPurple,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [_deepPurple.withOpacity(0.9), _softPurple.withOpacity(0.9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: _deepPurple.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/font2.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _pwhite.withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.chat_bubble_outline,
                        color: _deepPurple,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chat with Us!',
                            style: TextStyle(
                              fontFamily: 'Great Vibes',
                              color: _pwhite,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Get help with your floral needs',
                            style: TextStyle(
                              fontFamily: 'Lora',
                              color: _white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

  Widget _buildCategoryGrid() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 110,
            margin: const EdgeInsets.only(right: 15),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/frame.png',
                        width: 160,
                        height: 160,
                        fit: BoxFit.contain,
                      ),
                      ClipOval(
                        child: Image.asset(
                          _categories[index]['image']!,
                          width: 54,
                          height: 71,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _categories[index]['name']!,
                  style: TextStyle(
                    fontFamily: 'David Libre',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewArrivalsBanner(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewArrivalsPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: _softPurple.withOpacity(0.9),
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/sales.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Arrivals',
                      style: TextStyle(
                        fontFamily: 'Great Vibes',
                        color: _pwhite,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "check them out !!",
                      style: TextStyle(
                        fontFamily: 'Great Vibes',
                        color: _white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Exclusive offer - 10% Off This Week',
                      style: TextStyle(
                        fontFamily: 'Lora',
                        color: _deepPurple,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialFlowers() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _softPurple.withOpacity(0.9),
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/special.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'special flowers',
                  style: TextStyle(
                    fontFamily: 'Great Vibes',
                    color: _white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSellersGrid() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _topSellers.length,
        itemBuilder: (context, index) {
          final item = _topSellers[index];
          final isFavorite = _favoriteItems.contains(index);

          // Create item map with characteristics for ItemScreen
          final itemMap = {
            'name': item['name']!,
            'price': item['price']!,
            'originalPrice': item['originalPrice']!,
            'image': item['image']!,
            'characteristics': 'Elegant garden bouquet.', // Added for ItemScreen
            'liked': isFavorite,
          };

          // Only link the item with tops.jpg to ItemScreen
          final isTopsItem = item['image'] == 'assets/images/tops.jpg';

          return GestureDetector(
            onTap: isTopsItem
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemScreen(item: itemMap),
                      ),
                    );
                  }
                : null,
            child: Container(
              width: 140,
              margin: const EdgeInsets.only(right: 15),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _softSalmon,
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(color: _pwhite.withOpacity(0.3), width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 14,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                              child: Image.asset(
                                item['image']!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            color: _navShade,
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name']!,
                                  style: TextStyle(
                                    fontFamily: 'Lora',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: _darkText,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      item['price']!,
                                      style: TextStyle(
                                        fontFamily: 'David Libre',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: _deepPurple,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      item['originalPrice']!,
                                      style: TextStyle(
                                        fontFamily: 'David Libre',
                                        fontSize: 11,
                                        color: _greyText,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/frame2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: GestureDetector(
                      onTap: () => _toggleFavorite(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(scale: animation, child: child);
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            key: ValueKey(isFavorite),
                            color: isFavorite ? Colors.red : _greyText,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${item['name']} added to cart 🛒'),
                            backgroundColor: _deepPurple,
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: _greyText,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTopTulipList() {
    final colors = [
      {'name': 'Pink', 'color': const Color(0xFFFDE7E9), 'image': 'assets/images/rose1.jpg'},
      {'name': 'White', 'color': const Color(0xFFFAF9F7), 'image': 'assets/images/rose2.jpg'},
      {'name': 'Red', 'color': const Color(0xFFFBE9EA), 'image': 'assets/images/rose3.jpg'},
      {'name': 'Purple', 'color': const Color(0xFFF3E8FF), 'image': 'assets/images/rose4.jpg'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.2,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final item = colors[index];
          return Container(
            decoration: BoxDecoration(
              color: item['color'] as Color,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Opacity(
                      opacity: 0.15,
                      child: Image.asset(
                        item['image'] as String,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    item['name'] as String,
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _deepPurple,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}