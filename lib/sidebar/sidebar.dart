import 'package:flutter/material.dart';
class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('UZCOMMS'),
              accountEmail: Text('@students.uz.ac.zw'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/uz.png',
                    width: 90.0,
                    height: 90.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bc.png',

                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Gmail'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.web_rounded),
            title: const Text('emhare'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.support),
            title: const Text('Technical support & feedback'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.accessibility),
            title: const Text('Digital Accessibility'),
            onTap: () => null,
          ),

        ],
      ),
    );
  }
}
