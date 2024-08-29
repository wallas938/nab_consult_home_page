import 'package:flutter/material.dart';
import 'package:nab_consult_home_page/constantes/app-datas.dart';
import 'package:nab_consult_home_page/constantes/theme.colors.dart';
import 'package:nab_consult_home_page/util/responsive.dart';

class WhoWeAre extends StatelessWidget {
  const WhoWeAre({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        fontSize: ResponsiveUtil.isOnMobile(context)
            ? 14
            : ResponsiveUtil.isOnTablet(context)
                ? 21
                : 18,
        height: 1.5,
        color: AppColors.textColor,
        fontWeight: FontWeight.bold,
        fontFamily: "Instrument Sans");

    TextStyle nabConsultNameStyle = TextStyle(
        fontSize: ResponsiveUtil.isOnMobile(context)
            ? 14
            : ResponsiveUtil.isOnTablet(context)
                ? 21
                : 18,
        color: AppColors.titleColor,
        fontWeight: FontWeight.bold,
        fontFamily: "Instrument Sans",
        fontStyle: FontStyle.italic);

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ResponsiveUtil.isOnMobile(context)
            ? Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: mobileWidthLimit),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 32, horizontal: 16),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "QUI SOMMES NOUS ?\n\n",
                                style: TextStyle(
                                    fontSize: ResponsiveUtil.isOnMobile(context)
                                        ? 18
                                        : ResponsiveUtil.isOnTablet(context)
                                            ? 24
                                            : 28,
                                    color: AppColors.titleColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Instrument Sans"),
                              ),
                              TextSpan(
                                text:
                                    "Organisme de formation spécialisé dans le domaine de la sécurité, la santé et la prévention des risques professionnels, ",
                                style: textStyle,
                              ),
                              TextSpan(
                                text: "NAB CONSULT ",
                                style: nabConsultNameStyle,
                              ),
                              TextSpan(
                                text:
                                    "est une équipe de formateurs indépendants expérimentés disposant d’une pédagogie et une expérience professionnelles significatives.\n\n",
                                style: textStyle,
                              ),
                              TextSpan(
                                text: "Nos formations dispensées :\n\n",
                                style: textStyle,
                              ),
                              TextSpan(
                                text:
                                    "** AIPR\n\n** ATEX\n\n** SST\n\n** Gestes et postures\n\n** IRVE (P1 – P2 – P3)\n\n** Geste et prévention du risque chimique\n\n** Amiante (SS3 et SS4)\n\n** Habilitation électrique BT/HT - NFC – 18 510\n\n** Habilitation véhicule électrique – NFC – 18 550\n\n",
                                style: TextStyle(
                                    fontSize: ResponsiveUtil.isOnMobile(context)
                                        ? 14
                                        : ResponsiveUtil.isOnTablet(context)
                                            ? 21
                                            : 18,
                                    color: AppColors.textColor,
                                    decoration: TextDecoration.underline,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Instrument Sans"),
                              ),
                              TextSpan(
                                text:
                                    "C’est également des formateurs regroupés et structurés autour d’une même plateforme développée par ",
                                style: textStyle,
                              ),
                              TextSpan(
                                text: "NAB CONSULT ",
                                style: nabConsultNameStyle,
                              ),
                              TextSpan(
                                text:
                                    " permettant d’assurer à nos clients un suivi, une qualité et une disponibilité garantie de nos formateurs.\n\nNous vous proposons de mettre à profils notre organisation ainsi que notre expérience à travers nos formations qualifiantes pour jeunes et adultes.\n\nBasé en IDF, nous intervenons sur demande dans tout l’hexagone. N’hésitez pas à nous contacter pour une éventuelle collaboration.",
                                style: textStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ResponsiveUtil.isOnTablet(context)
                ? Center(
                    child: Container(
                      constraints:
                          const BoxConstraints(maxWidth: tabletWidthLimit),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 32, horizontal: 16),
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "QUI SOMMES NOUS ?\n\n",
                                    style: TextStyle(
                                        fontSize: ResponsiveUtil.isOnMobile(
                                                context)
                                            ? 18
                                            : ResponsiveUtil.isOnTablet(context)
                                                ? 24
                                                : 28,
                                        color: AppColors.titleColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Instrument Sans"),
                                  ),
                                  TextSpan(
                                    text:
                                        "Organisme de formation spécialisé dans le domaine de la sécurité, la santé et la prévention des risques professionnels, ",
                                    style: textStyle,
                                  ),
                                  TextSpan(
                                    text: "NAB CONSULT ",
                                    style: nabConsultNameStyle,
                                  ),
                                  TextSpan(
                                    text:
                                        "est une équipe de formateurs indépendants expérimentés disposant d’une pédagogie et une expérience professionnelles significatives.\n\n",
                                    style: textStyle,
                                  ),
                                  TextSpan(
                                    text: "Nos formations dispensées :\n\n",
                                    style: textStyle,
                                  ),
                                  TextSpan(
                                    text:
                                        "** AIPR\n\n** ATEX\n\n** SST\n\n** Gestes et postures\n\n** IRVE (P1 – P2 – P3)\n\n** Geste et prévention du risque chimique\n\n** Amiante (SS3 et SS4)\n\n** Habilitation électrique BT/HT - NFC – 18 510\n\n** Habilitation véhicule électrique – NFC – 18 550\n\n",
                                    style: TextStyle(
                                        fontSize: ResponsiveUtil.isOnMobile(
                                                context)
                                            ? 14
                                            : ResponsiveUtil.isOnTablet(context)
                                                ? 21
                                                : 18,
                                        color: AppColors.textColor,
                                        decoration: TextDecoration.underline,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Instrument Sans"),
                                  ),
                                  TextSpan(
                                    text:
                                        "C’est également des formateurs regroupés et structurés autour d’une même plateforme développée par ",
                                    style: textStyle,
                                  ),
                                  TextSpan(
                                    text: "NAB CONSULT ",
                                    style: nabConsultNameStyle,
                                  ),
                                  TextSpan(
                                    text:
                                        " permettant d’assurer à nos clients un suivi, une qualité et une disponibilité garantie de nos formateurs.\n\nNous vous proposons de mettre à profils notre organisation ainsi que notre expérience à travers nos formations qualifiantes pour jeunes et adultes.\n\nBasé en IDF, nous intervenons sur demande dans tout l’hexagone. N’hésitez pas à nous contacter pour une éventuelle collaboration.",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      constraints:
                          const BoxConstraints(maxWidth: desktopWidthLimit),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 32, horizontal: 16),
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "QUI SOMMES NOUS ?\n\n",
                                    style: TextStyle(
                                        fontSize: ResponsiveUtil.isOnMobile(
                                                context)
                                            ? 18
                                            : ResponsiveUtil.isOnTablet(context)
                                                ? 24
                                                : 28,
                                        color: AppColors.titleColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Instrument Sans"),
                                  ),
                                  TextSpan(
                                    text:
                                        "Organisme de formation spécialisé dans le domaine de la sécurité, la santé et la prévention des risques professionnels, ",
                                    style: textStyle,
                                  ),
                                  TextSpan(
                                    text: "NAB CONSULT ",
                                    style: nabConsultNameStyle,
                                  ),
                                  TextSpan(
                                    text:
                                        "est une équipe de formateurs indépendants expérimentés disposant d’une pédagogie et une expérience professionnelles significatives.\n\n",
                                    style: textStyle,
                                  ),
                                  TextSpan(
                                    text: "Nos formations dispensées :\n\n",
                                    style: textStyle,
                                  ),
                                  TextSpan(
                                    text:
                                        "** AIPR\n\n** ATEX\n\n** SST\n\n** Gestes et postures\n\n** IRVE (P1 – P2 – P3)\n\n** Geste et prévention du risque chimique\n\n** Amiante (SS3 et SS4)\n\n** Habilitation électrique BT/HT - NFC – 18 510\n\n** Habilitation véhicule électrique – NFC – 18 550\n\n",
                                    style: TextStyle(
                                        fontSize: ResponsiveUtil.isOnMobile(
                                                context)
                                            ? 14
                                            : ResponsiveUtil.isOnTablet(context)
                                                ? 21
                                                : 18,
                                        color: AppColors.textColor,
                                        decoration: TextDecoration.underline,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Instrument Sans"),
                                  ),
                                  TextSpan(
                                    text:
                                        "C’est également des formateurs regroupés et structurés autour d’une même plateforme développée par ",
                                    style: textStyle,
                                  ),
                                  TextSpan(
                                    text: "NAB CONSULT ",
                                    style: nabConsultNameStyle,
                                  ),
                                  TextSpan(
                                    text:
                                        " permettant d’assurer à nos clients un suivi, une qualité et une disponibilité garantie de nos formateurs.\n\nNous vous proposons de mettre à profils notre organisation ainsi que notre expérience à travers nos formations qualifiantes pour jeunes et adultes.\n\nBasé en IDF, nous intervenons sur demande dans tout l’hexagone. N’hésitez pas à nous contacter pour une éventuelle collaboration.",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
  }
}
