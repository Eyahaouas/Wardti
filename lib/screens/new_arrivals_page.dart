import 'package:flutter/material.dart';
import 'dart:async';

class NewArrivalsPage extends StatefulWidget {
  const NewArrivalsPage({super.key});

  @override
  State<NewArrivalsPage> createState() => _NewArrivalsPageState();
}

class _NewArrivalsPageState extends State<NewArrivalsPage> {
  static const Color _deepPurple = Color(0xFF5A3C83);
  static const Color _softPurple = Color(0xFF8E6BBF);
  static const Color _greyText = Color(0xFF6D6D6D);

  final PageController _promoController = PageController(viewportFraction: 0.7);
  int _currentPage = 1; // le violet au milieu

  List<Map<String, dynamic>> get newArrivals => [
        {
          'image': 'assets/images/new1.jpg',
          'title': 'Royal Bloom Collection',
          'price': '\ 10 dt',
          'description': 'Luxurious arrangement of seasonal flowers'
        },
        {
          'image': 'assets/images/new2.jpg',
          'title': 'Enchanted Garden',
          'price': '\ 8 dt',
          'description': 'Wildflower bouquet with delicate accents'
        },
        {
          'image': 'assets/images/new3.jpg',
          'title': 'Moonlight Elegance',
          'price': '\ 15 dt',
          'description': 'White floral arrangement for evening events'
        },
      ];

  final List<Map<String, dynamic>> _promos = [
  {
    'text': '20% OFF - Mothers day',
    'color': Color(0xFFF5C6C6), // pastel pink
    'opacity': 0.3
  },
  {
    'text': '10% OFF - Limited Time',
    'color': Color(0xFFF7BFC9), // pastel blue
    'opacity': 0.3
  },
  {
    'text': '15% OFF - New Customers',
    'color': Color(0xFFC8A2F7), // pastel green
    'opacity': 0.3
  },
  
];



  @override
void initState() {
  super.initState();

  // Attendre que le widget soit construit avant de déplacer la page
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _promoController.jumpToPage(_currentPage);
  });

  // Défilement automatique
  Timer.periodic(const Duration(seconds: 3), (timer) {
    if (_promoController.hasClients) {
      _currentPage = (_currentPage + 1) % _promos.length;
      _promoController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _deepPurple,
        title: const Text(
          'New Arrivals',
          style: TextStyle(
            fontFamily: 'Great Vibes',
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0, // enlève l’effet noir
      ),
      body: Stack(
        children: [
          Container(
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
              ),
            ),
          ),
          Opacity(
            opacity: 0.1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/font.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildPromoCarousel(),
                const SizedBox(height: 30),
                ...newArrivals.map((item) => _buildArrivalCard(
                      image: item['image'],
                      title: item['title'],
                      price: item['price'],
                      description: item['description'],
                    )),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCarousel() {
    return SizedBox(
      height: 140,
      child: PageView.builder(
        controller: _promoController,
        itemCount: _promos.length,
        itemBuilder: (context, index) {
          final promo = _promos[index];
          return AnimatedScale(
            scale: index == _currentPage ? 1.0 : 0.9,
            duration: const Duration(milliseconds: 300),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: promo['color'].withOpacity(promo['opacity']),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  promo['text'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildArrivalCard({
    required String image,
    required String title,
    required String price,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _deepPurple,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 16,
                      color: _greyText,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: _deepPurple,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 3,
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.w600,
                          ),
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
    );
  }
}
