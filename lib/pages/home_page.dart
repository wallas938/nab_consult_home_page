import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nab_consult_home_page/constantes/app-datas.dart';
import 'package:nab_consult_home_page/constantes/theme.colors.dart';
import 'package:nab_consult_home_page/constantes/theme.typo.dart';
import 'package:nab_consult_home_page/util/responsive.dart';

TextStyle cardTitleStyle = TextStyle(
    fontStyle: FontStyle.italic,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 12.sp,
    decorationStyle: TextDecorationStyle.solid);

TextStyle cardDescriptionStyle = TextStyle(
    fontStyle: FontStyle.normal,
    color: Colors.white70,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    decorationStyle: TextDecorationStyle.solid);

List<Widget> _buildCertificationList(BuildContext context, int firstIndex) {
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
        fontSize: _responsiveFontSize(context, 12, 16, 425),
      ),
    );

    items.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            "- ${trainingData[firstIndex].certifications[index].name}",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: AppColors.white,
              fontSize: _responsiveFontSize(context, 12, 16, 425),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: durationText,
        ),
      ],
    ));
  }
  return items;
}

double _responsiveFontSize(BuildContext context, double fontsize,
    double fontMaxSize, double screenMaxSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth >= screenMaxSize ? fontMaxSize : fontsize.sp;
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
            HeroSection(),
            /*** FORMATIONS_SECTION ***/
            TrainingSection(),
            /*** TESTIMONIALS_SECTION ***/
            // TestimonialSection(),
            /*** FEATURES_SECTION ***/
            // FeatureSection()
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
    return Container(
      width: ResponsiveUtil.isOnMobile(context)
          ? 458
          : ResponsiveUtil.isOnTablet(context)
              ? 891
              : 1280,
      color: Colors.redAccent,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "DÉCOUVREZ NOS FORMATIONS",
            style: TextStyle(
                fontFamily: "Instrument Sans",
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: _responsiveFontSize(context, 12, 21, 425),
                height: 1.5,
                color: Colors.black),
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
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 650
                ),
                itemCount: trainingData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(1.5, 1.5),
                            color: Colors.black.withOpacity(.5),
                            spreadRadius: 2,
                            blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[500],
                    ),
                    child: Column(
                      children: [
                        /*** CARD_HEADER ***/
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  trainingData[index].trainingImagePath),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                          ),
                        ),
                        /*** CARD_BODY ***/
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /*** TRAINING_TITLE ***/
                                      Expanded(
                                        child: Text(
                                          trainingData[index].trainingTitle,
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: _responsiveFontSize(
                                                  context, 12, 16, 425),
                                              decorationStyle:
                                                  TextDecorationStyle.solid),
                                        ),
                                      ),
                                      /*** TRAINING_DURATION ***/
                                      Text(
                                        trainingData[index].duration != null
                                            ? "${trainingData[index].duration} jour(s)"
                                            : "",
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: AppColors.amber,
                                            fontWeight: FontWeight.w700,
                                            fontSize: _responsiveFontSize(
                                                context, 11.5, 14, 425),
                                            decorationStyle:
                                                TextDecorationStyle.solid),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  /*** CARD_DESCRIPTION ***/
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      trainingData[index].description ?? "",
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w500,
                                          fontSize: _responsiveFontSize(
                                              context, 12, 16, 425),
                                          decorationStyle:
                                              TextDecorationStyle.solid),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Divider(
                                    height: 1,
                                    color: AppColors.grey,
                                  ),
                                  const SizedBox(height: 8),
                                  /*** CERTIFICATIONS ***/
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children:
                                          _buildCertificationList(context, index),
                                    ),
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
                                      child: const Text(
                                        "Détails de la formation",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
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
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
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

    List<Widget> buildTestimonialListWidget() {
      return testimonialData
          .map((t) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: 320,
                  margin:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
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
                        height: 8,
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        t.text,
                        style: testimonialStyle,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(t.author, style: testimonialStyle),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        t.position,
                        style: testimonialStyle,
                      )
                    ],
                  ),
                ),
              ))
          .toList();
    }

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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: buildTestimonialListWidget(),
          ),
        ],
      ),
    );
  }
}

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  List<Widget> buildFeatureListWidget() {
    return features
        .map((f) =>
            /*** FEATURE_CARD_CONTAINER ***/
            Container(
              width: 280,
              height: 420,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 1),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  /*** FEATURE_IMAGE ***/
                  Expanded(
                    child: Image.asset(
                        width: double.infinity, f.imagePath, fit: BoxFit.fill),
                  ),
                  /*** FEATURE_BODY ***/
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          /*** FEATURE_NAME ***/
                          Text(
                            f.name,
                            style: TextStyle(
                              fontSize: 15.sp,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                              fontFamily: "Instrument Sans",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          /*** FEATURE_DESCRIPTION ***/
                          Expanded(
                            child: Text(f.description,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: "Instrument Sans",
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          "VOS OUTILS DU QUOTIDIEN",
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
        Column(
          mainAxisSize: MainAxisSize.max,
          children: buildFeatureListWidget(),
        )
      ],
    );
  }
}
