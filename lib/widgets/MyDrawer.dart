import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nab_consult_home_page/constantes/app-datas.dart';
import 'package:nab_consult_home_page/constantes/theme.colors.dart';
import 'package:nab_consult_home_page/constantes/theme.typo.dart';

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
          });
        },
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.amberOpacityTo4,
            ),
            child: Image.asset("assets/images/nab_consult.png"),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: const Text("Quitter", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent
              ),),
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
          const Divider(
            height: .1,
            color: AppColors.grey,
          ),
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

// Row(
//   children: [
//     const SizedBox(
//       width: 20,
//     ),
//     const Icon(
//       Icons.home,
//       color: Color.fromRGBO(255, 193, 7, .9),
//       size: 28,
//     ),
//     Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(right: 150),
//         child: ListTile(
//           title: Text(
//             textAlign: TextAlign.center,
//             'Accueil',
//             style: AppTypography.headingS(Colors.black),
//           ),
//           focusColor: Colors.amber,
//           selected: true,
//           onTap: () {
//             // Update the state of the app.
//             // ...
//           },
//         ),
//       ),
//     ),
//   ],
// ),
// const SizedBox(
//   height: 10,
// ),
// /*** ABOUT_US_LINK ***/
// Row(
//   children: [
//     const SizedBox(
//       width: 20,
//     ),
//     const Icon(
//       Icons.group,
//       color: Color.fromRGBO(255, 193, 7, .9),
//       size: 28,
//     ),
//     Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(right: 50),
//         child: ListTile(
//           title: Text(
//             textAlign: TextAlign.center,
//             'Qui Sommes Nous ?',
//             style: AppTypography.headingS(Colors.black),
//           ),
//           focusColor: Colors.amber,
//           selected: true,
//           onTap: () {
//             // Update the state of the app.
//             // ...
//           },
//         ),
//       ),
//     ),
//   ],
// ),
// const SizedBox(
//   height: 10,
// ),
// /*** CONTACT_US_LINK ***/
// Row(
//   children: [
//     const SizedBox(
//       width: 20,
//     ),
//     const Icon(
//       Icons.mail,
//       color: Color.fromRGBO(255, 193, 7, .9),
//       size: 28,
//     ),
//     Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(right: 83),
//         child: ListTile(
//           title: Text(
//             textAlign: TextAlign.center,
//             'Nous Contacter',
//             style: AppTypography.headingS(Colors.black),
//           ),
//           focusColor: Colors.amber,
//           selected: true,
//           onTap: () {
//             // Update the state of the app.
//             // ...
//           },
//         ),
//       ),
//     ),
//   ],
// ),
// SizedBox(
//   height: 30.h,
// ),
// const Divider(
//   color: Colors.black26,
//   thickness: .3,
// ),
// const SizedBox(
//   height: 15,
// ),
