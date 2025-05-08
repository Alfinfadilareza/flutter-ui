import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Column"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ColumnPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Row"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RowPage()),
              );
            },
          ),
          ListTile(
            title: const Text("GridView"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GridViewPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Stack"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StackPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Padding"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaddingPage()),
              );
            },
          ),
          ListTile(
            title: const Text("AspectRatio"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AspectRatioPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("ListView"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyListView()),
              );
            },
          ),
          ListTile(
            title: const Text("Center"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CenterPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Expanded"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExpandedPage()),
              );
            },
          ),
          ListTile(
            title: const Text("SizedBox"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SizedBoxPage()),
              );
            },
          ),
          ListTile(
            title: const Text("MyWrap"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWrap()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Container Page
class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Column")),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: const Column(
          children: [
            Text(
              "Stylish Chair",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Rp. 350.000",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF9A9390),
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowPage extends StatelessWidget {
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Row")),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
            ),
            const Text(
              "Detail",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
            ),
            IconButton(
              icon: const Icon(Icons.share, size: 32),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView")),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset.zero,
                  blurRadius: 15,
                ),
              ],
            ),
            child: Center(
              child: Text(
                (index + 1).toString(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" Stack")),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(Icons.shopping_cart, size: 50),
            Positioned(
              top: -4,
              right: -4,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaddingPage extends StatelessWidget {
  const PaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Padding")),
      body: Container(
        height: 500,
        width: 300,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all()),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 30, bottom: 40),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AspectRatioPage extends StatelessWidget {
  const AspectRatioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman AspectRatio")),
      body: AspectRatio(
        aspectRatio: 180 / 240,
        child: Container(color: Colors.red),
      ),
    );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final List<String> categories = [
    "All",
    "Living Room",
    "Bedroom",
    "Dining Room",
    "Kitchen",
    "Office",
    "Outdoor",
    "Accessories",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Coding Flutter - ListView")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 35,
            child: CustomListView(
              categories: categories,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 200,
            child: CustomListView(
              categories: categories,
              scrollDirection: Axis.vertical,
            ),
          ),
          SizedBox(
            height: 200,
            child: CustomListView(
              categories: categories,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.categories,
    required this.scrollDirection,
  });

  final List<String> categories;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      children: List.generate(categories.length, (index) {
        return GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Text(
              categories[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CenterPage extends StatelessWidget {
  const CenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Center")),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.grey[20],
                  elevation: 5.0,
                ),
                child: Text(
                  "Add To Cart".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedPage extends StatelessWidget {
  const ExpandedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Center")),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: const Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "List checklist ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Icon(Icons.check, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SizedBoxPage extends StatelessWidget {
  const SizedBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Center")),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Size",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Height 120cm",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Width 80cm",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWrap extends StatelessWidget {
  MyWrap({super.key});

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Coding Flutter - Wrap")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children:
                  colors.map((color) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.grey),
                          color: color,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: Offset.zero,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
