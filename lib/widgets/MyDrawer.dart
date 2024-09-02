import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nab_consult_home_page/constantes/app-datas.dart';
import 'package:nab_consult_home_page/constantes/theme.colors.dart';
import 'package:nab_consult_home_page/constantes/theme.typo.dart';
import 'package:nab_consult_home_page/main.dart';
import 'package:nab_consult_home_page/pages/who_we_are.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selected = 0;

  List<Widget> _buildListItems() {
    List<Widget> items = [];
    for (int index = 0; index < menuData.length; index++) {
      items.add(ListTile(
        selectedColor: AppColors.amber,
        leading: menuData[index].icon,
        title: Text(menuData[index].title),
        selected: _selected == index,
        onTap: () {
          setState(() {
            _selected = index;
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => menuData[index].title == "Accueil"
                    ? const HomePage()
                    : menuData[index].title == "Qui Sommes Nous ?"
                        ? const WhoWeAre()
                        : const HomePage(),
              ),
            );
          });
        },
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
            ),
            child: Image.asset("assets/images/nab_consult_logo.png"),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(
                size: 28,
                Icons.close,
                shadows: [
                  Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2.0,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ],
              ),
              iconColor: Colors.redAccent,
            ),
          ),
          // const Divider(
          //   height: .1,
          //   color: AppColors.grey,
          // ),
          const SizedBox(
            height: 20,
          ),
          /*** MENU_ITEM_LIST ***/
          Column(
            children: _buildListItems(),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: .1,
            color: AppColors.grey,
          ),
          const SizedBox(
            height: 30,
          ),
          /*** CONNEXION_BUTTON ***/
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 193, 7, .9),
                        padding: const EdgeInsets.all(20),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.login,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Connexion",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
