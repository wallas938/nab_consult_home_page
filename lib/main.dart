import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nab_consult_home_page/pages/home_page.dart';
import 'package:nab_consult_home_page/util/responsive.dart';
import 'package:nab_consult_home_page/widgets/MyDrawer.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          );
        });
  }
}

