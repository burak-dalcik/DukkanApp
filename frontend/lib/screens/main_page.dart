import 'package:flutter/material.dart';
import 'package:kirt_apideneme/screens/personel.dart';
import 'package:kirt_apideneme/screens/products.dart';



class Ana_Sayfa extends StatefulWidget {
  const Ana_Sayfa({super.key});

  @override
  _Ana_SayfaState createState() => _Ana_SayfaState();
}

class _Ana_SayfaState extends State<Ana_Sayfa> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Ürün Listeleme',
      style: optionStyle,
    ),
    Text(
      'Index 1: Satış Ekranı',
      style: optionStyle,
    ),
    Text(
      'Index 2: Personel Ekranı',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ANA SAYFA'),
        backgroundColor: Colors.yellowAccent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      backgroundColor: Colors.amberAccent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Ürün Ara',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Ürün araması yapılacak
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Center(child: _widgetOptions[_selectedIndex]),
                // Diğer ürün listesi öğeleri buraya eklenecek
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // Drawer içeriği buraya gelecek
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Ürün Listeleme'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);

                // Ali() sayfasına geçiş yap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductsPage()),
                );
              },

            ),
            ListTile(
              title: const Text('İNDİRİM EKRANI'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);

                // Ali() sayfasına geçiş yap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonelPage()),
                );
              },
            ),
            ListTile(
              title: const Text('MÜŞTERİ YÖNETİMİ'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('TOPTANCI EKRANI'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('ÜRÜN GÜNCELLEME '),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);

                // Ali() sayfasına geçiş yap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('ÜRÜN GÜNCELLEME '),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('PERSONEL YÖNETİMİ '),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
