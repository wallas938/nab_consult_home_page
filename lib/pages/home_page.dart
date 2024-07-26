import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nab_consult_home_page/constantes/app-datas.dart';
import 'package:nab_consult_home_page/constantes/theme.colors.dart';
import 'package:nab_consult_home_page/constantes/theme.typo.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: screenW,
        decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //   colors: [Colors.white12, Colors.white10],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // )
        ),
        child: Expanded(
          child: Column(
            children: [
              /*** HERO_SECTION ***/
              SizedBox(
                width: double.maxFinite,
                child: Stack(
                  children: [
                    /*** IMAGE ***/
                    Image.asset(
                      "assets/images/hero_image_4.webp",
                      colorBlendMode: BlendMode.overlay,
                    ),
                    /*** IMAGE_WITH_BLACK_SCREEN_OPACITY ***/
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(.1),
                      ),
                    ),
                    /*** CATCHPHRASE ***/
                    Positioned(
                        top: 45.sp,
                        left: 20.sp,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Avec ',
                                style: TextStyle(
                                  fontFamily: "Instrument Sans",
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                  shadows: [
                                    Shadow(
                                      offset:
                                      const Offset(1.5, 1.5),
                                      blurRadius: 2.0,
                                      color: Colors.black
                                          .withOpacity(0.8),
                                    ),
                                  ],
                                ),
                              ),
                              TextSpan(
                                text: 'NAB Consult\n\n',
                                style: TextStyle(
                                  fontFamily: "Instrument Sans",
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.grey,
                                  fontSize: 18.sp,
                                  shadows: [
                                    Shadow(
                                      offset:
                                      const Offset(1.5, 1.5),
                                      blurRadius: 2.0,
                                      color: Colors.black
                                          .withOpacity(0.8),
                                    ),
                                  ],
                                ),
                              ),
                              TextSpan(
                                text:
                                'Élevez vos standards\net formez vous à la sécurité électrique\nde vos équipes',
                                style: TextStyle(
                                  fontFamily: "Instrument Sans",
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  shadows: [
                                    Shadow(
                                      offset:
                                      const Offset(1.5, 1.5),
                                      blurRadius: 2.0,
                                      color: Colors.black
                                          .withOpacity(0.8),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              /*** FORMATIONS_SECTION ***/
              SizedBox(
                width: double.infinity.sp,
                child: SizedBox(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      /*** SECTION_TITLE ***/
                      Text(
                        "DÉCOUVREZ NOS FORMATIONS",
                        style:
                        AppTypography.headingS(Colors.black),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      /*** CARDS_LIST ***/
                      SizedBox(
                        width: double.infinity,
                        height: 350,
                        child: ListView.builder(
                            itemCount: trainingData.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  /*** FIRST_CARD ***/
                                  Container(
                                    margin: const EdgeInsets
                                        .symmetric(
                                        vertical: 10,
                                        horizontal: 20),
                                    width: double.infinity,
                                    height: 300,
                                    child: Column(
                                      children: [
                                        /*** CARD_HEADER ***/
                                        Container(
                                            width:
                                            double.infinity,
                                            height: 180,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(trainingData[
                                                    index]
                                                        .trainingImagePath),
                                                    fit:
                                                    BoxFit
                                                        .fill),
                                                borderRadius: const BorderRadius
                                                    .only(
                                                    topLeft: Radius
                                                        .circular(
                                                        8),
                                                    topRight:
                                                    Radius.circular(
                                                        8)))),
                                        /*** CARD_BODY ***/
                                        Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius
                                                      .circular(
                                                      8),
                                                  bottomRight: Radius
                                                      .circular(
                                                      8))),
                                          width: double.infinity,
                                          height: 400,
                                          child: null,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
