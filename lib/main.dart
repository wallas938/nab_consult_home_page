import 'package:flutter/material.dart';
import 'package:nab_consult_home_page/pages/home_page.dart';
import 'package:nab_consult_home_page/pages/who_we_are.dart';
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
        ? const TextStyle(decoration: TextDecoration.underline, fontSize: 21)
        : const TextStyle(fontSize: 21);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: !ResponsiveUtil.isOnDesktop(context)
              ? const Size.fromHeight(50)
              : const Size.fromHeight(80),
          child: AppBar(
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: ResponsiveUtil.isOnDesktop(context)
                    ? [
                        TextButton(
                            onPressed: () {
                              _updatedIndex(0);
                            },
                            child: Text("Accueil", style: styleCurrentLink(0))),
                        TextButton(
                            onPressed: () {
                              _updatedIndex(1);
                            },
                            child: Text("Qui sommes nous ?",
                                style: styleCurrentLink(1))),
                        TextButton(
                            onPressed: () {
                              _updatedIndex(2);
                            },
                            child: Text("Nous contacter",
                                style: styleCurrentLink(2))),
                      ]
                    : [],
              ),
            ),
            centerTitle: false,
            title: ResponsiveUtil.isOnDesktop(context)
                ? const Text("NAB CONSULT")
                : null,
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
        ),
        drawer: !ResponsiveUtil.isOnDesktop(context) ? const MyDrawer() : null,
        body:  const MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
