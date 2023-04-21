import 'package:flutter/material.dart';
import 'package:weddingplanner/pages/adminpages/photography_page.dart';
import 'package:weddingplanner/pages/adminpages/stylists_page.dart';
import 'package:weddingplanner/pages/adminpages/weddingcards_page.dart';
import 'package:weddingplanner/pages/adminpages/weddingdresses_page.dart';

import 'adminpages/caterer_page.dart';
import 'adminpages/honeymoon_page.dart';
import 'adminpages/liquor_page.dart';
import 'adminpages/weddingcars_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            child: Text('Admin Menu',
                style: TextStyle(
                  fontSize: 30,
                )),
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text('Caterers'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const CatererPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Honeymoon'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HoneymoonPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.wine_bar),
            title: const Text('Liquor'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const LiquorPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Photography'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const PhotographyPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.style),
            title: const Text('Stylists'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const StylistsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text('Wedding Cards'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const WeddingCardsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_car),
            title: const Text('Wedding Cars'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const WeddingCarsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.girl),
            title: const Text('Wedding Dresses'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const WeddingDressesPage()));
            },
          ),
        ],
      ),
    );
  }
}
