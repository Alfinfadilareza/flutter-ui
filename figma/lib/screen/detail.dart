import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ProductDetailPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedColorIndex = 0;

  final List<String> colorNames = ['Abu-abu', 'Coklat Muda', 'Krem'];
  final List<String> imagePaths = [
    'assets/images/sofa.png',
    'assets/images/sofa2.png',
    'assets/images/sofa3.png',
  ];

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
                Image.asset('assets/images/simbol.png', height: 40),
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Pilihan gambar warna vertikal
                      Column(
                        children: List.generate(imagePaths.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColorIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedColorIndex == index
                                      ? Colors.red
                                      : Colors.transparent,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                imagePaths[index],
                                width: 50,
                                height: 50,
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 16),
                      // Gambar utama
                      Expanded(
                        child: Image.asset(
                          imagePaths[selectedColorIndex],
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Sofa',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Rp80.000',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'BUY',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Deskripsi Produk
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deskripsi:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(
                    "Sofa minimalis berkapasitas dua orang, dirancang dengan bahan kain linen berkualitas tinggi dan busa empuk yang nyaman untuk bersantai. Cocok untuk ruang tamu, ruang keluarga, maupun area santai di kantor.",
                  ),
                  SizedBox(height: 12),
                  Text("Fitur Utama:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("• Rangka kayu solid dan kokoh"),
                  Text("• Bantalan duduk empuk dan tidak mudah kempes"),
                  Text("• Desain modern minimalis"),
                  Text("• Kain pelapis mudah dibersihkan"),
                  SizedBox(height: 12),
                  Text("Dimensi:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("• Panjang: 160 cm"),
                  Text("• Lebar: 75 cm"),
                  Text("• Tinggi: 80 cm"),
                  SizedBox(height: 12),
                  Text("Warna Tersedia:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("• Abu-abu"),
                  Text("• Cokelat muda"),
                  Text("• Krem"),
                  SizedBox(height: 12),
                  Text("Perawatan:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      "Lap menggunakan kain lembap secara berkala. Hindari paparan langsung sinar matahari agar warna tetap awet."),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Pesanan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
