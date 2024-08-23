import 'package:flutter/material.dart';
import 'package:nab_consult_home_page/constantes/app-datas.dart';

class WhoWeAre extends StatelessWidget {
  const WhoWeAre({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: mobilePadding,
      child: Wrap(
        children: [
          Text("QUI SOMMES NOUS ?\n\n"),
          Text(
              "Organisme de formation spécialisé dans le domaine de la sécurité, la santé et la prévention des risques professionnels."),
          Text("NAB CONSULT"),
          Text("est une équipe de formateurs indépendants expérimentés disposant d’une pédagogie et une expérience professionnelles significatives.\nLes formations proposées par NAB CONSULT:\nAIPR\nATEX\nSST\nGestes et postures\nIRVE (P1 – P2 – P3)\nGeste et prévention du risque chimique\nAmiante (SS3 et SS4)\nHabilitation électrique BT/HT - NFC – 18 510\nHabilitation véhicule électrique – NFC – 18 550\nC’est également des formateurs regroupés et structurés autour d’une même plateforme développée par NAB CONSULT permettant d’assurer à nos clients un suivi, une qualité et une disponibilité garantie de nos formateurs. Nous vous proposons de mettre à profils notre organisation ainsi que notre expérience à travers nos formations qualifiantes pour jeunes et adultes. Basé en IDF, nous intervenons sur demande dans tout l’hexagone. N’hésitez pas à nous contacter pour une éventuelle collaboration.")
        ],
      ),
    );
  }
}
