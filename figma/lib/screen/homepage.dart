import 'package:flutter/material.dart';

void main() => runApp(const FurnitureApp());

class FurnitureApp extends StatelessWidget {
  const FurnitureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProductPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/simbol.png', height: 40), // Logo
                const Text(
                  'Furniturepedia',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Filter kategori
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                FilterChip(
                    label: Text("Living room"),
                    selected: false,
                    onSelected: null),
                SizedBox(width: 8),
                FilterChip(
                    label: Text("Bedroom"), selected: false, onSelected: null),
                SizedBox(width: 8),
                FilterChip(
                    label: Text("Kitchen"), selected: false, onSelected: null),
                SizedBox(width: 8),
                FilterChip(
                    label: Text("Bathroom"), selected: false, onSelected: null),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Grid Produk
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
                children: const [
                  ProductCard(
                      name: 'Sofa',
                      price: 'Rp60.000',
                      image: 'assets/images/sofa.png'),
                  ProductCard(
                      name: 'Cabinet',
                      price: 'Rp80.000',
                      image: 'assets/images/cabinet.png'),
                  ProductCard(
                      name: 'Wood floor',
                      price: 'Rp20.000',
                      image: 'assets/images/woodfloor.png'),
                  ProductCard(
                      name: 'Shoe rack',
                      price: 'Rp40.000',
                      image: 'assets/images/Shoerack.png'),
                  ProductCard(
                      name: 'buvet',
                      price: 'Rp100.000',
                      image: 'assets/images/buvet.png'),
                  ProductCard(
                      name: 'buvet',
                      price: 'Rp30.000',
                      image: 'assets/images/buvet2.png'),
                  ProductCard(
                      name: 'Tree',
                      price: 'Rp10.000',
                      image: 'assets/images/tree.png'),
                  ProductCard(
                      name: 'Gazebo',
                      price: 'Rp60.000',
                      image: 'assets/images/gazebo.png'),
                ],
              ),
            ),
          ),

          // Pagination
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('<'),
                SizedBox(width: 12),
                Text('1',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue)),
                SizedBox(width: 12),
                Text('2'),
                SizedBox(width: 12),
                Text('3'),
                SizedBox(width: 12),
                Text('4'),
                SizedBox(width: 12),
                Text('>'),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Review'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const ProductCard({
    required this.name,
    required this.price,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Image.asset(image, fit: BoxFit.contain)),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(price, style: const TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
