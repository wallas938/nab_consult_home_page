import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nab_consult_home_page/constantes/app-datas.dart';
import 'package:nab_consult_home_page/constantes/theme.colors.dart';
import 'package:nab_consult_home_page/constantes/theme.typo.dart';

TextStyle cardTitleStyle = TextStyle(
    fontStyle: FontStyle.italic,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    decorationStyle: TextDecorationStyle.solid);

TextStyle cardDescriptionStyle = TextStyle(
    fontStyle: FontStyle.normal,
    color: Colors.white70,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    decorationStyle: TextDecorationStyle.solid);

List<Widget> _buildCertificationList(int firstIndex) {
  List<Widget> items = [];
  for (int index = 0;
      index < trainingData[firstIndex].certifications.length;
      index++) {
    Text durationText = Text(
        trainingData[firstIndex].certifications[index].duration != null
            ? " => ${trainingData[firstIndex].certifications[index].duration} jour(s)"
            : "",
        style: TextStyle(
            fontStyle: FontStyle.normal,
            color: AppColors.amber,
            fontSize: 12.sp));
    items.add(Wrap(
      children: [
        Text(
          "- ${trainingData[firstIndex].certifications[index].name}",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: AppColors.white,
              fontSize: 12.sp),
        ),
        durationText,
      ],
    ));
  }
  return items;
}

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
        child: const Column(
          children: [
            /*** HERO_SECTION ***/
            // HeroSection(),
            /*** FORMATIONS_SECTION ***/
            // TrainingSection(),
            /*** TESTIMONIALS_SECTION ***/
            TestimonialSection()
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                            offset: const Offset(1.5, 1.5),
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.8),
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
                            offset: const Offset(1.5, 1.5),
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.8),
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
                            offset: const Offset(1.5, 1.5),
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class TrainingSection extends StatelessWidget {
  const TrainingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity.sp,
      child: SizedBox(
        child: Column(
          children: [
            /*** SECTION_TITLE ***/
            const SizedBox(
              height: 30,
            ),
            Text(
              "DÉCOUVREZ NOS FORMATIONS",
              style: AppTypography.headingS(Colors.black),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: .1,
              color: AppColors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            /*** CARDS_LIST ***/
            SizedBox(
              width: double.infinity,
              height: 550,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: trainingData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /*** CARD_CONTAINER ***/
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 4),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: const Offset(0, 1),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                            gradient: LinearGradient(
                              colors: [
                                Colors.blueGrey.shade800,
                                Colors.grey.shade700,
                                Colors.grey.shade600,
                                Colors.blueGrey.shade400,
                              ],
                              stops: const [0.1, 0.3, 0.7, 1],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          width: double.infinity,
                          child: Column(
                            children: [
                              /*** CARD_HEADER ***/
                              Container(
                                  width: double.infinity,
                                  height: 200,
                                  foregroundDecoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(trainingData[index]
                                              .trainingImagePath),
                                          fit: BoxFit.fill),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)))),
                              /*** CARD_BODY ***/
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8))),
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 24.0,
                                      left: 12,
                                      right: 12,
                                      bottom: 16),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /*** CARD_TITLE ***/
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              trainingData[index].trainingTitle,
                                              style: cardTitleStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      /*** CARD_DESCRIPTION ***/
                                      Text(
                                        trainingData[index].description ?? "",
                                        style: cardDescriptionStyle,
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Divider(
                                        height: 1,
                                        color: AppColors.grey,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      /*** CERTIFICATIONS ***/
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:
                                            _buildCertificationList(index),
                                      ),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      /*** CARD_BUTTON ***/
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 24),
                                            backgroundColor: AppColors.amber,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            elevation: 5,
                                          ),
                                          child: Text(
                                            "Détails de la formation",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              shadows: const [
                                                Shadow(
                                                  blurRadius: 2.0,
                                                  color: Colors.black54,
                                                  offset: Offset(1.0, 1.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
    );
  }
}

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle testimonialStyle = TextStyle(
        fontSize: 11.5.sp,
        fontFamily: "Instrument Sans",
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.amberAccent);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "LEURS TÉMOIGNAGES",
            style: AppTypography.headingS(Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: .1,
            color: AppColors.grey,
          ),
          const SizedBox(
            height: 50,
          ),
          /*** TESTIMONIALS_LIST ***/
          CarouselSlider(
              items: testimonialData
                  .map((t) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.5),
                                  blurRadius: 2.0,
                                  offset: const Offset(1, 1))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.format_quote,
                                  size: 28.0.sp,
                                  color: Colors.amberAccent,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.justify,
                                    t.text,
                                    style: testimonialStyle,
                                  ),
                                ),
                                Expanded(
                                    child:
                                        Text(t.author, style: testimonialStyle)),
                                const SizedBox(
                                  height: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    t.position,
                                    style: testimonialStyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  disableCenter: true,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  enlargeCenterPage: true)),
        ],
      ),
    );
  }
}
