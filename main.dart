import 'package:flutter/material.dart';

void main() => runApp(const DinanathApp());

class DinanathApp extends StatelessWidget {
  const DinanathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinanath Jewellers',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB8860B)),
        scaffoldBackgroundColor: const Color(0xFFF9F7F2),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  final cats = ['Gold', 'Diamond', 'Bridal', 'Silver'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('दीनानाथ ज्वेलर्स',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Bahera Bazar, Darbhanga',
                style: TextStyle(fontSize: 11)),
          ],
        ),
      ),
      body: IndexedStack(index: tab, children: [
        _home(),
        _collections(),
        _wishlist(),
        _account(),
      ]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => setState(() => tab = i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.grid_view_outlined),
              selectedIcon: Icon(Icons.grid_view),
              label: 'Collections'),
          NavigationDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: 'Wishlist'),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Account'),
        ],
      ),
    );
  }

  Widget _home() => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 190,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                  colors: [Color(0xFFF2D88A), Color(0xFFFFF8DD)]),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Timeless Elegance',
                    style:
                        TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Discover beautiful jewellery for every occasion.'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Shop by Category',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 105,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: cats.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) => SizedBox(
                width: 88,
                child: Column(children: [
                  CircleAvatar(
                      radius: 31,
                      child: Icon(i == 1 ? Icons.diamond : Icons.auto_awesome)),
                  const SizedBox(height: 7),
                  Text(cats[i]),
                ]),
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Text('Featured Jewellery',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(children: [
            _card('Elegant Necklace', 'Gold • 22K'),
            const SizedBox(width: 12),
            _card('Diamond Ring', 'Diamond')
          ]),
        ],
      );

  Widget _card(String title, String sub) => Expanded(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                    height: 125,
                    width: double.infinity,
                    child: Center(child: Icon(Icons.diamond, size: 58))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 2),
                    child: Text(title,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
                    child: Text(sub)),
              ]),
        ),
      );

  Widget _collections() => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Collections',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search jewellery...',
                  border: OutlineInputBorder())),
          const SizedBox(height: 18),
          for (final c in cats)
            Card(
                child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.diamond)),
                    title: Text('$c Collection'),
                    trailing: const Icon(Icons.chevron_right))),
        ],
      );

  Widget _wishlist() => const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.favorite_border, size: 70),
          SizedBox(height: 12),
          Text('Your Wishlist is empty',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ]),
      );

  Widget _account() => ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          CircleAvatar(radius: 42, child: Icon(Icons.person, size: 45)),
          SizedBox(height: 18),
          Center(
              child: Text('My Account',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold))),
          SizedBox(height: 24),
          ListTile(
              leading: Icon(Icons.person_outline), title: Text('Profile')),
          ListTile(
              leading: Icon(Icons.favorite_border), title: Text('Wishlist')),
          ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text('Bahera Bazar, Darbhanga')),
        ],
      );
}
