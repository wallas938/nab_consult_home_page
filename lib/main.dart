import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nab_consult_home_page/pages/home_page.dart';
import 'package:nab_consult_home_page/util/responsive.dart';
import 'package:nab_consult_home_page/widgets/MyDrawer.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _updatedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TextStyle styleCurrentLink(int index) {
    return _selectedIndex == index
        ? const TextStyle(
      decoration: TextDecoration.underline,
    )
        : const TextStyle();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(320, 497),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                actions: !ResponsiveUtil.isOnMobile(context)
                    ? [
                        TextButton(
                            onPressed: () {
                              _updatedIndex(0);
                            },
                            child: Text(
                              "Accueil",
                              style: styleCurrentLink(0)
                            )),
                        TextButton(
                            onPressed: () {
                              _updatedIndex(1);
                            },
                            child: Text(
                              "Qui sommes nous ?",
                              style: styleCurrentLink(1)
                            )),
                        TextButton(
                            onPressed: () {
                              _updatedIndex(2);
                            },
                            child: Text(
                              "Nous contacter",
                              style: styleCurrentLink(2)
                            )),
                      ]
                    : [],
                title: const Text("Nab Consult"),
                leading: !ResponsiveUtil.isOnDesktop(context)
                    ? Builder(
                        builder: (context) {
                          return IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          );
                        },
                      )
                    : null,
              ),
              drawer:
                  ResponsiveUtil.isOnDesktop(context) ? null : const MyDrawer(),
              body: const MyHomePage(),
            ),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
