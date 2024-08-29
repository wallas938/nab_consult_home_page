import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nab_consult_home_page/constantes/app-datas.dart';
import 'package:nab_consult_home_page/constantes/theme.colors.dart';
import 'package:nab_consult_home_page/util/responsive.dart';

TextStyle cardTitleStyle = const TextStyle(
    fontStyle: FontStyle.italic,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    decorationStyle: TextDecorationStyle.solid);

TextStyle cardDescriptionStyle = const TextStyle(
    fontStyle: FontStyle.normal,
    color: Colors.white70,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    decorationStyle: TextDecorationStyle.solid);

List<Widget> _buildCertificationList(BuildContext context, int firstIndex) {
  List<Widget> items = [];
  for (int index = 0;
      index < trainingData[firstIndex].certifications.length;
      index++) {
    items.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            "- ${trainingData[firstIndex].certifications[index].name}",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: AppColors.white,
              fontSize: _responsiveFontSize(context, 12, 16, mobileWidthLimit),
            ),
          ),
        ),
      ],
    ));
  }
  return items;
}

Widget _buildSectionHeader(String title, BuildContext context) {
  return Wrap(
    children: [
      SizedBox(
        width: double.infinity,
        height: ResponsiveUtil.isOnMobile(context)
            ? 30
            : ResponsiveUtil.isOnTablet(context)
                ? 70
                : 120,
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              fontFamily: "Instrument Sans",
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: ResponsiveUtil.isOnMobile(context)
                  ? 18
                  : ResponsiveUtil.isOnTablet(context)
                      ? 24
                      : 32,
              height: 1.5,
              color: Colors.black),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      const Divider(
        height: .1,
        color: AppColors.grey,
      ),
      SizedBox(
        height: ResponsiveUtil.isOnMobile(context)
            ? 20
            : ResponsiveUtil.isOnTablet(context)
                ? 50
                : 70,
      ),
    ],
  );
}

double _responsiveFontSize(BuildContext context, double fontsize,
    double fontMaxSize, double screenMaxSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth >= screenMaxSize ? fontMaxSize : fontsize;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController scrollController = ScrollController();

  bool isNumberSectionVisible = false;

  final GlobalKey _widgetKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isWidgetVisible()) {
        setState(() {
          isNumberSectionVisible = true;
        });
      }
    });
  }

  bool _isWidgetVisible() {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    return offset.dy >= 0 && offset.dy <= MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          /*** HERO_SECTION ***/
          const HeroSection(),
          /*** FORMATIONS_SECTION ***/
          const TrainingSection(),
          /*** NUMBERS_SECTION ***/
          if (scrollController.hasClients)
            Visibility(
                key: _widgetKey,
                visible: isNumberSectionVisible,
                child: const NumbersSection()),
          // NumbersSection(),
          /*** FEATURES_SECTION ***/
          const FeatureSection(),
          /*** TESTIMONIALS_SECTION ***/
          const TestimonialSection(),
          /*** PARTNERS_SECTION ***/
          const PartnerSection(),
        ],
      ),
    );
  }
}

class NumbersSection extends StatefulWidget {
  const NumbersSection({super.key});

  @override
  State<NumbersSection> createState() => _NumbersSectionState();
}

class _NumbersSectionState extends State<NumbersSection> {
  final int successValue = 98;
  final int internNumber = 600 * 5;
  final GlobalKey key = GlobalKey();

  Widget _numbersSectionForMobile() {
    return Visibility(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          /*** SUCCESS_RATE ***/
          TweenAnimationBuilder(
            tween: IntTween(begin: 0, end: successValue),
            duration: const Duration(milliseconds: 1500),
            builder: (BuildContext context, int value, Widget? child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Taux de réussite",
                    style: TextStyle(
                        color: Color.fromRGBO(70, 130, 180, 1),
                        fontFamily: "Instrument Sans",
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    "$value %",
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            "ET",
            style: TextStyle(
                color: Color.fromRGBO(70, 130, 180, 1),
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 18,
          ),
          /*** INNERS_NUMBER ***/
          TweenAnimationBuilder(
            tween: IntTween(begin: 0, end: internNumber),
            duration: const Duration(milliseconds: 1500),
            builder: (BuildContext context, int value, Widget? child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "+ de $value",
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  const Text(
                    "Participants",
                    style: TextStyle(
                        color: Color.fromRGBO(70, 130, 180, 1),
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _numbersSectionForTablet() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /*** SUCCESS_RATE ***/
        TweenAnimationBuilder(
          tween: IntTween(begin: 0, end: successValue),
          duration: const Duration(milliseconds: 1500),
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Taux de réussite",
                  style: TextStyle(
                      color: Color.fromRGBO(70, 130, 180, 1),
                      fontFamily: "Instrument Sans",
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$value %",
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 42,
                      fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 18,
        ),
        const Text(
          "ET",
          style: TextStyle(
              color: Color.fromRGBO(70, 130, 180, 1),
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 18,
        ),
        /*** INNERS_NUMBER ***/
        TweenAnimationBuilder(
          tween: IntTween(begin: 0, end: internNumber),
          duration: const Duration(milliseconds: 1500),
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "+ de $value",
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 48,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Participants",
                  style: TextStyle(
                      color: Color.fromRGBO(70, 130, 180, 1),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _numbersSectionForDesktop() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 24,
          ),
          /*** SUCCESS_RATE ***/
          TweenAnimationBuilder(
            tween: IntTween(begin: 0, end: successValue),
            duration: const Duration(milliseconds: 1500),
            builder: (BuildContext context, int value, Widget? child) {
              return Row(
                children: [
                  const Text(
                    "Taux de réussite",
                    style: TextStyle(
                        color: Color.fromRGBO(70, 130, 180, 1),
                        fontFamily: "Instrument Sans",
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Text(
                    "$value %",
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 42,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            width: 24,
          ),
          const Text(
            "ET",
            style: TextStyle(
                color: Color.fromRGBO(70, 130, 180, 1),
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 24,
          ),
          /*** INNERS_NUMBER ***/
          TweenAnimationBuilder(
            tween: IntTween(begin: 0, end: internNumber),
            duration: const Duration(milliseconds: 1500),
            builder: (BuildContext context, int value, Widget? child) {
              return Row(
                children: [
                  Text(
                    "+ de $value",
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 48,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  const Text(
                    "Participants",
                    style: TextStyle(
                        color: Color.fromRGBO(70, 130, 180, 1),
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      height: ResponsiveUtil.isOnMobile(context)
          ? 280
          : ResponsiveUtil.isOnTablet(context)
              ? 400
              : 370,
      child: Column(
        children: [
          _buildSectionHeader("QUELQUES CHIFFRES", context),
          ResponsiveUtil.isOnMobile(context)
              ? Container(
                  constraints: const BoxConstraints(
                    maxWidth: mobileWidthLimit,
                  ),
                  child: _numbersSectionForMobile(),
                )
              : ResponsiveUtil.isOnTablet(context)
                  ? Container(
                      constraints: const BoxConstraints(
                        maxWidth: tabletWidthLimit,
                      ),
                      child: _numbersSectionForTablet(),
                    )
                  : Container(
                      constraints: const BoxConstraints(
                        maxWidth: desktopWidthLimit,
                      ),
                      child: _numbersSectionForDesktop(),
                    )
        ],
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
      width: double.infinity,
      child: Stack(
        children: [
          /*** IMAGE ***/
          SizedBox(
            child: Image.asset(
              "assets/images/hero_image_4.webp",
              colorBlendMode: BlendMode.overlay,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          /*** IMAGE_WITH_BLACK_SCREEN_OPACITY ***/
          Positioned.fill(
            child: Container(
              width: double.infinity,
              color: Colors.black.withOpacity(.1),
            ),
          ),
          /*** CATCHPHRASE ***/
          Positioned(
              top: MediaQuery.of(context).size.width / 7.111,
              left: MediaQuery.of(context).size.width / 16,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'NAB Consult\n',
                      style: TextStyle(
                        fontFamily: "Instrument Sans",
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                        fontSize: MediaQuery.of(context).size.width / 17.8,
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
                          '\nVotre organisme de formation à la sécurité,\n la santé et la prévention\ndes risques professionnels.',
                      style: TextStyle(
                        fontFamily: "Instrument Sans",
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 22.857,
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
    Widget mobileView = ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: trainingData.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[500],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /*** CARD_HEADER ***/
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(trainingData[index].trainingImagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                  ),
                ),
                /*** CARD_BODY ***/
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                        context, 12, 16, mobileWidthLimit),
                                    decorationStyle: TextDecorationStyle.solid),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        /*** CARD_DESCRIPTION ***/
                        Text(
                          trainingData[index].description ?? "",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                              fontSize: _responsiveFontSize(
                                  context, 12, 16, mobileWidthLimit),
                              decorationStyle: TextDecorationStyle.solid),
                        ),
                        const SizedBox(height: 18),
                        const Divider(
                          height: 1,
                          color: AppColors.grey,
                        ),
                        const SizedBox(height: 24),
                        /*** CERTIFICATIONS ***/
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildCertificationList(context, index),
                        ),
                        const SizedBox(height: 32),
                        /*** CARD_BUTTON ***/
                        Flexible(
                          fit: FlexFit.loose,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 24, horizontal: 24),
                                  backgroundColor: AppColors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
    Widget tabletView = GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 950, crossAxisSpacing: 16),
        itemCount: trainingData.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[500],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /*** CARD_HEADER ***/
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage(trainingData[index].trainingImagePath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                  ),
                ),
                /*** CARD_BODY ***/
                Expanded(
                  flex: 5,
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
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                          context, 12, 16, mobileWidthLimit),
                                      decorationStyle:
                                          TextDecorationStyle.solid),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          /*** CARD_DESCRIPTION ***/
                          Expanded(
                            child: Text(
                              trainingData[index].description ?? "",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                  fontSize: _responsiveFontSize(
                                      context, 12, 16, mobileWidthLimit),
                                  decorationStyle: TextDecorationStyle.solid),
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Divider(
                            height: 1,
                            color: AppColors.grey,
                          ),
                          const SizedBox(height: 24),
                          /*** CERTIFICATIONS ***/
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildCertificationList(context, index),
                          ),
                          const SizedBox(height: 32),
                          /*** CARD_BUTTON ***/
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 24, horizontal: 24),
                                  backgroundColor: AppColors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
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
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
    Widget desktopView = GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 900, crossAxisSpacing: 24),
        itemCount: trainingData.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[500],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /*** CARD_HEADER ***/
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage(trainingData[index].trainingImagePath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                  ),
                ),
                /*** CARD_BODY ***/
                Expanded(
                  flex: 7,
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
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              /*** TRAINING_TITLE ***/
                              Expanded(
                                child: Text(
                                  trainingData[index].trainingTitle,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21,
                                      decorationStyle:
                                          TextDecorationStyle.solid),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          /*** CARD_DESCRIPTION ***/
                          Expanded(
                            child: Text(
                              trainingData[index].description ?? "",
                              style: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  decorationStyle: TextDecorationStyle.solid),
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Divider(
                            height: 1,
                            color: AppColors.grey,
                          ),
                          const SizedBox(height: 24),
                          /*** CERTIFICATIONS ***/
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildCertificationList(context, index),
                          ),
                          const SizedBox(height: 32),
                          /*** CARD_BUTTON ***/
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 24, horizontal: 24),
                                  backgroundColor: AppColors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
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
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });

    return Column(
      children: [
        _buildSectionHeader("DÉCOUVREZ NOS FORMATIONS", context),
        ResponsiveUtil.isOnMobile(context)
            ? Container(
                padding: mobilePadding,
                constraints: const BoxConstraints(maxWidth: mobileWidthLimit),
                child: mobileView)
            : ResponsiveUtil.isOnTablet(context)
                ? Container(
                    padding: tabletPadding,
                    constraints:
                        const BoxConstraints(maxWidth: tabletWidthLimit),
                    child: tabletView)
                : Container(
                    padding: desktopPadding,
                    constraints:
                        const BoxConstraints(maxWidth: desktopWidthLimit),
                    child: desktopView)
      ],
    );
  }
}

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle testimonialTextStyle = const TextStyle(
        fontSize: 14,
        fontFamily: "Instrument Sans",
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Color.fromRGBO(50, 50, 50, 1));
    TextStyle testimonialInfoStyle = const TextStyle(
        fontSize: 12,
        fontFamily: "Instrument Sans",
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Color.fromRGBO(70, 130, 180, 1));

    List<Widget> buildTestimonialListWidgetForMobile() {
      return testimonialData
          .map((t) => Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(220, 220, 220, 1),
                    Color.fromRGBO(245, 245, 245, 1),
                    Color.fromRGBO(255, 255, 255, 1),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.15), // Ombre plus légère
                      blurRadius: 4.0, // Légèrement plus flou
                      offset: const Offset(2, 2), // Décalage plus prononcé
                    ),
                  ],
                  color: Colors.white, // Fond blanc
                  borderRadius:
                      BorderRadius.circular(18), // Garde les bords arrondis
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.format_quote,
                        size: 28.0,
                        color: Color.fromRGBO(70, 130, 180, 1),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        t.text,
                        style: testimonialTextStyle,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(t.author, style: testimonialInfoStyle),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        t.position,
                        style: testimonialInfoStyle,
                      )
                    ],
                  ),
                ),
              ))
          .toList();
    }

    Widget buildTestimonialListWidgetForTablet() {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: testimonialData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 14,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(220, 220, 220, 1),
                Color.fromRGBO(245, 245, 245, 1),
                Color.fromRGBO(255, 255, 255, 1),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15), // Ombre plus légère
                  blurRadius: 4.0, // Légèrement plus flou
                  offset: const Offset(2, 2), // Décalage plus prononcé
                ),
              ],
              color: Colors.white, // Fond blanc
              borderRadius:
                  BorderRadius.circular(18), // Garde les bords arrondis
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.format_quote,
                    size: 44,
                    color: Color.fromRGBO(70, 130, 180, 1),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    textAlign: TextAlign.justify,
                    testimonialData[index].text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Instrument Sans",
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(50, 50, 50, 1)),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(testimonialData[index].author,
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Instrument Sans",
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(70, 130, 180, 1))),
                Text(
                  testimonialData[index].position,
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "Instrument Sans",
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(70, 130, 180, 1)),
                )
              ],
            ),
          );
        },
      );
    }

    Widget buildTestimonialListWidgetForDesktop() {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 400),
        itemCount: testimonialData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 14,
            ),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(220, 220, 220, 1),
                Color.fromRGBO(245, 245, 245, 1),
                Color.fromRGBO(255, 255, 255, 1),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15), // Ombre plus légère
                  blurRadius: 4.0, // Légèrement plus flou
                  offset: const Offset(2, 2), // Décalage plus prononcé
                ),
              ],
              color: Colors.white, // Fond blanc
              borderRadius:
                  BorderRadius.circular(18), // Garde les bords arrondis
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.format_quote,
                    size: 72,
                    color: Color.fromRGBO(70, 130, 180, 1),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  textAlign: TextAlign.justify,
                  testimonialData[index].text,
                  style: const TextStyle(
                      fontSize: 21,
                      fontFamily: "Instrument Sans",
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(50, 50, 50, 1)),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(testimonialData[index].author,
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Instrument Sans",
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(70, 130, 180, 1))),
                Text(
                  testimonialData[index].position,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Instrument Sans",
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(70, 130, 180, 1)),
                )
              ],
            ),
          );
        },
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSectionHeader("LEURS TÉMOIGNAGES", context),
          /*** TESTIMONIALS_LIST ***/
          if (ResponsiveUtil.isOnMobile(context))
            Container(
                padding: mobilePadding,
                constraints: const BoxConstraints(maxWidth: mobileWidthLimit),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: buildTestimonialListWidgetForMobile(),
                ))
          else if (ResponsiveUtil.isOnTablet(context))
            Container(
                padding: tabletPadding,
                constraints: const BoxConstraints(maxWidth: tabletWidthLimit),
                child: buildTestimonialListWidgetForTablet())
          else
            Container(
                padding: desktopPadding,
                constraints: const BoxConstraints(maxWidth: desktopWidthLimit),
                child: buildTestimonialListWidgetForDesktop())
        ],
      ),
    );
  }
}

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  List<Widget> buildMobileFeatureListWidget(BuildContext context) {
    return features
        .map((f) =>
            /*** FEATURE_CARD_CONTAINER ***/
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: double.infinity,
                height: 450,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(220, 220, 220, 1),
                    Color.fromRGBO(245, 245, 245, 1),
                    Color.fromRGBO(255, 255, 255, 1),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 4.0,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    /*** FEATURE_IMAGE ***/
                    Expanded(
                      child: Image.asset(
                        width: double.infinity,
                        f.imagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                    /*** FEATURE_BODY ***/
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            /*** FEATURE_NAME ***/
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                f.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.titleColor,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: "Instrument Sans",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            /*** FEATURE_DESCRIPTION ***/
                            Expanded(
                              child: Text(f.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
        .toList();
  }

  Widget buildTabletFeatureListWidget() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            maxCrossAxisExtent: 400,
            mainAxisExtent: 500),
        itemCount: features.length,
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(220, 220, 220, 1),
                  Color.fromRGBO(245, 245, 245, 1),
                  Color.fromRGBO(255, 255, 255, 1),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 4.0,
                    offset: const Offset(2, 2),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  /*** FEATURE_IMAGE ***/
                  Expanded(
                    child: Image.asset(
                        width: double.infinity,
                        features[index].imagePath,
                        fit: BoxFit.fill),
                  ),
                  /*** FEATURE_BODY ***/
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          /*** FEATURE_NAME ***/
                          Text(
                            features[index].name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.titleColor,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          /*** FEATURE_DESCRIPTION ***/
                          Expanded(
                            child: Text(features[index].description,
                                style: const TextStyle(
                                  fontSize: 16,
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
            ),
          );
        });
  }

  Widget buildDesktopFeatureListWidget() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 38, crossAxisCount: 1, mainAxisExtent: 450),
        itemCount: features.length,
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(220, 220, 220, 1),
                  Color.fromRGBO(245, 245, 245, 1),
                  Color.fromRGBO(255, 255, 255, 1),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15), // Ombre plus légère
                    blurRadius: 4.0, // Légèrement plus flou
                    offset: const Offset(2, 2), // Décalage plus prononcé
                  ),
                ],
                color: Colors.white, // Fond blanc
                borderRadius:
                    BorderRadius.circular(18), // Garde les bords arrondis
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection:
                    index % 2 == 0 ? TextDirection.rtl : TextDirection.ltr,
                children: [
                  /*** FEATURE_BODY ***/
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          /*** FEATURE_NAME ***/
                          Align(
                            alignment: index % 2 == 0
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                features[index].name,
                                style: const TextStyle(
                                  fontSize: 28,
                                  color: AppColors.titleColor,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 58,
                          ),
                          /*** FEATURE_DESCRIPTION ***/
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(features[index].description,
                                  textAlign: index % 2 == 0
                                      ? TextAlign.end
                                      : TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontFamily: "Instrument Sans",
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*** FEATURE_IMAGE ***/
                  Expanded(
                    flex: 5,
                    child: SizedBox(
                      height: double.maxFinite,
                      child: ClipRRect(
                        borderRadius: index % 2 == 0
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(18),
                                bottomLeft: Radius.circular(18))
                            : const BorderRadius.only(
                                topRight: Radius.circular(18),
                                bottomRight: Radius.circular(18)),
                        child: Image.asset(
                            width: double.infinity,
                            features[index].imagePath,
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionHeader("VOS OUTILS DU QUOTIDIEN", context),
        ResponsiveUtil.isOnMobile(context)
            ? Container(
                padding: mobilePadding,
                constraints: const BoxConstraints(maxWidth: mobileWidthLimit),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: buildMobileFeatureListWidget(context),
                ))
            : ResponsiveUtil.isOnTablet(context)
                ? Container(
                    padding: tabletPadding,
                    constraints:
                        const BoxConstraints(maxWidth: tabletWidthLimit),
                    child: buildTabletFeatureListWidget())
                : Container(
                    padding: desktopPadding,
                    constraints:
                        const BoxConstraints(maxWidth: desktopWidthLimit),
                    child: buildDesktopFeatureListWidget()),
      ],
    );
  }
}

class PartnerSection extends StatelessWidget {
  const PartnerSection({super.key});

  Widget buildForMobile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/images/image_bureau_veritas_logo.jpg",
              width: MediaQuery.of(context).size.width / 3.2),
          Image.asset("assets/images/image_temis_formation_logo.jpg",
              width: MediaQuery.of(context).size.width / 3.2),
        ],
      ),
    );
  }

  Widget buildForTablet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/image_bureau_veritas_logo.jpg",
              width: MediaQuery.of(context).size.width / 4.26),
          const SizedBox(
            width: 150,
          ),
          Image.asset("assets/images/image_temis_formation_logo.jpg",
              width: MediaQuery.of(context).size.width / 4.26),
        ],
      ),
    );
  }

  Widget buildForDesktop(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/image_bureau_veritas_logo.jpg",
              width: MediaQuery.of(context).size.width / 4.26),
          const SizedBox(
            width: 150,
          ),
          Image.asset("assets/images/image_temis_formation_logo.jpg",
              width: MediaQuery.of(context).size.width / 4.26),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          _buildSectionHeader("Ils nous font confiance", context),
          ResponsiveUtil.isOnMobile(context)
              ? buildForMobile(context)
              : ResponsiveUtil.isOnTablet(context)
                  ? buildForTablet(context)
                  : buildForDesktop(context)
        ],
      ),
    );
  }
}
