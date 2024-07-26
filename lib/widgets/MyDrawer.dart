import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nab_consult_home_page/constantes/theme.colors.dart';
import 'package:nab_consult_home_page/constantes/theme.typo.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.close),
            title: const Text("Fermer"),
          ),
          const Divider(
            height: 1,
            color: AppColors.grey,
          ),
          const SizedBox(
            height: 30,
          ),
          /*** HOME_LINK ***/
          // ListView.builder(
          //     itemCount: menuData.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         leading: menuData[index].menuIcon,
          //         title: menuData[index].title,
          //         onTap: () {},
          //       );
          //     }), // NEW_DRAWER_TO_USE
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.home,
                color: Color.fromRGBO(255, 193, 7, .9),
                size: 28,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      'Accueil',
                      style: AppTypography.headingS(Colors.black),
                    ),
                    focusColor: Colors.amber,
                    selected: true,
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          /*** ABOUT_US_LINK ***/
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.group,
                color: Color.fromRGBO(255, 193, 7, .9),
                size: 28,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      'Qui Sommes Nous ?',
                      style: AppTypography.headingS(Colors.black),
                    ),
                    focusColor: Colors.amber,
                    selected: true,
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          /*** CONTACT_US_LINK ***/
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.mail,
                color: Color.fromRGBO(255, 193, 7, .9),
                size: 28,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 83),
                  child: ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      'Nous Contacter',
                      style: AppTypography.headingS(Colors.black),
                    ),
                    focusColor: Colors.amber,
                    selected: true,
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          const Divider(
            color: Colors.black26,
            thickness: .3,
          ),
          const SizedBox(
            height: 15,
          ),
          /*** CONNEXION_BUTTON ***/
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: 0, horizontal: 20),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor:
                        const Color.fromRGBO(255, 193, 7, .9),
                        padding: const EdgeInsets.all(24),
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
