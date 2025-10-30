import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'new_item_screen.dart';
import 'seller_historique.dart';
import 'profile_screen.dart';

class SellerScreen extends StatefulWidget {
  const SellerScreen({super.key});

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  static const Color _deepPurple = Color(0xFF5A3C83);
  static const Color _softPurple = Color(0xFF8E6BBF);
  static const Color _lightPurple = Color(0xFFE6E0F3);
  static const Color _white = Color(0xFFffedec);
  static const Color _darkText = Color(0xFF2D2D2D);
  static const Color _greyText = Color(0xFF6D6D6D);
  static const Color _pwhite = Color(0xFFFAF5FF);
  static const Color _softSalmon = Color(0xFFFDEEE7);
  static const Color _navShade = Color(0xFFF7F3FB);

  final List<Map<String, dynamic>> sellerFlowers = [
    {
      'name': 'Lily Bouquet',
      'image': 'assets/images/rose1.jpg',
      'price': '\ 6 dt',
      'originalPrice': '\ 11 dt',
      'characteristics': 'Elegant white petals, perfect for weddings.',
      'sold': false,
    },
    {
      'name': 'Red Roses',
      'image': 'assets/images/rose2.jpg',
      'price': '\ 6 dt',
      'originalPrice': '\11 dt',
      'characteristics': 'Classic red blooms, symbol of love.',
      'sold': true,
    },
    {
      'name': 'Sunflower Bunch',
      'image': 'assets/images/rose3.jpg',
      'price': '\ 7 dt',
      'originalPrice': '\ 12 dt',
      'characteristics': 'Bright yellow petals, cheerful vibe.',
      'sold': false,
    },
    {
      'name': 'Purple Orchids',
      'image': 'assets/images/rose4.jpg',
      'price': '\ 8 dt',
      'originalPrice': '\ 14 dt',
      'characteristics': 'Exotic purple blooms, luxurious appearance.',
      'sold': false,
    },
    {
      'name': 'Pink Tulips',
      'image': 'assets/images/rose1.jpg',
      'price': '\ 9 dt',
      'originalPrice': '\ 15 dt',
      'characteristics': 'Delicate pink petals, spring collection.',
      'sold': true,
    },
    {
      'name': 'Mixed Bouquet',
      'image': 'assets/images/rose2.jpg',
      'price': '\ 5 dt',
      'originalPrice': '\ 10 dt',
      'characteristics': 'Colorful mix, perfect for any occasion.',
      'sold': false,
    },
  ];

  final List<Map<String, dynamic>> examplePosts = [
    {
      'name': 'Recent Rose Bouquet',
      'image': 'assets/images/rose4.jpg',
      'price': '\ 5 dt',
      'characteristics': 'Similar to your usual rose posts.',
      'sold': false,
    },
    {
      'name': 'Similar Lily Arrangement',
      'image': 'assets/images/rose1.jpg',
      'price': '\ 6 dt',
      'characteristics': 'Recent publication similar to your style.',
      'sold': false,
    },
    {
      'name': 'Trending Daisies',
      'image': 'assets/images/rose3.jpg',
      'price': '\ 7 dt',
      'characteristics': 'Popular choice this week.',
      'sold': false,
    },
    {
      'name': 'Seasonal Carnations',
      'image': 'assets/images/rose2.jpg',
      'price': '\ 8 dt',
      'characteristics': 'Perfect for current season.',
      'sold': false,
    },
  ];

  final List<Map<String, dynamic>> statistics = [
    {
      'label': 'Total Items Sold',
      'value': '12',
      'icon': Icons.sell,
    },
    {
      'label': 'Revenue Generated',
      'value': '\ 100 dt',
      'icon': Icons.attach_money,
    },
    {
      'label': 'Active Listings',
      'value': '4',
      'icon': Icons.store,
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
          _buildBackground(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                _buildAppHeader(),
                const SizedBox(height: 50),
                _buildSectionTitle('Some Posts Example'),
                const SizedBox(height: 20),
                _buildExamplePostsBanner(),
                const SizedBox(height: 30),
                _buildInspirationSection(),
                const SizedBox(height: 30),
                _buildSectionTitle('Your Listings'),
                const SizedBox(height: 15),
                _buildListingsGrid(),
                const SizedBox(height: 30),
                _buildSectionTitle('Sales Statistics'),
                const SizedBox(height: 15),
                _buildStatisticsGrid(),
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
          child: const Icon(Icons.add_rounded, size: 28, color: Colors.white),
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
            currentIndex: 0,
            onTap: (index) {
              if (index == 0) {
              } else if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NewItemScreen()),
                );
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
                    'Wardti Seller',
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
      },
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

  Widget _buildExamplePostsBanner() {
    return Padding(
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
                    'Example Posts',
                    style: TextStyle(
                      fontFamily: 'Great Vibes',
                      color: _pwhite,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Inspire your next listing!",
                    style: TextStyle(
                      fontFamily: 'Great Vibes',
                      color: _white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Trending styles this week',
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
    );
  }

  Widget _buildInspirationSection() {
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
                  'Generate with AI',
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

  Widget _buildListingsGrid() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: sellerFlowers.length,
        itemBuilder: (context, index) {
          final flower = sellerFlowers[index];
          return Container(
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
                              flower['image'],
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
                                flower['name'],
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
                                    flower['price'],
                                    style: TextStyle(
                                      fontFamily: 'David Libre',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: _deepPurple,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    flower['originalPrice'],
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
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: flower['sold'] ? Colors.red.withOpacity(0.8) : Colors.green.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      flower['sold'] ? 'Sold' : 'Available',
                      style: const TextStyle(
                        fontFamily: 'Lora',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
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
          );
        },
      ),
    );
  }

  Widget _buildStatisticsGrid() {
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
        itemCount: statistics.length,
        itemBuilder: (context, index) {
          final stat = statistics[index];
          return Container(
            decoration: BoxDecoration(
              color: _softSalmon,
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
                        'assets/images/rose1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        stat['icon'] as IconData,
                        color: _deepPurple,
                        size: 30,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        stat['label'],
                        style: TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _deepPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        stat['value'],
                        style: TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: _darkText,
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
    );
  }
}