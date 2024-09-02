import 'package:flutter/material.dart';

class FeatureItem {
  final String name;
  final String description;
  final String imagePath;

  FeatureItem(
      {required this.name, required this.description, required this.imagePath});
}

class MenuItem {
  final Icon icon;
  final String title;

  MenuItem({
    required this.icon,
    required this.title,
  });
}

class TrainingData {
  final String trainingTitle;
  final String trainingImagePath;
  final List<CertificationData> certifications;
  final String? description;

  TrainingData(
      {this.description,
      required this.trainingTitle,
      required this.trainingImagePath,
      required this.certifications});
}

class CertificationData {
  final String name;
  final String? description;

  CertificationData({required this.name, this.description});
}

class Testimonial {
  final String text;
  final String author;
  final String position;
  final double height;

  Testimonial(
      {required this.text,
      required this.author,
      required this.position,
      required this.height});
}

final List<FeatureItem> features = [
  FeatureItem(
      name: "Calendrier interactif",
      imagePath: "assets/images/image_calendar.webp",
      description:
          "Grace à la synchronisation instantanée du calendrier interactif des formateurs, réserver à tout moment  vos formations prévisionnelles ou de dernière minute."),
  FeatureItem(
      name: "QCM Dématerialisé",
      imagePath: "assets/images/image_qcm_feature.webp",
      description:
          "Vous aurez accès à un générateur de QCM sécurisé de dernière génération facilitant ainsi le suivi des compétences nouvellement acquises de vos collaborateurs."),
  FeatureItem(
      name: "Questionnaire de satisfaction",
      imagePath: "assets/images/image_satisfaction_client.webp",
      description:
          "Dans une démarche d’amélioration constante de nos prestations, toute nos formations sont soumises à un formulaire de satisfaction concernant l’environnement, les outils et la pédagogie de nos formateurs. L’objectif principal recherché est l’excellence en la matière."),
  FeatureItem(
      name: "Feuille d'émargement numérique",
      imagePath: "assets/images/image_emerge.webp",
      description:
          "Dites au revoir aux feuilles d'émargements et accueillez les feuilles de présence en ligne sécurisées avec signature électronique pour plus de flexibilité et un gain de temps non négligeable."),
];

final List<Testimonial> testimonialData = [
  Testimonial(
      text:
          "Un grand merci à Nabil pour nous avoir encadré ces deux jours à la formation habilitation à l'électricité. Merci : pour son professionnalisme, sa bienveillance, sa patience et son sens de la pédagogie (pas évident d'enseigner des notions d'électricité à des professionnels de santé).\n\nJe vous souhaite une belle continuation.",
      author: "Alexiane",
      position: "(Aide-soignante à la clinique Champ Notre Dame à Taverny)",
      height: 340),
  Testimonial(
      text:
          "Merci pour cette formation et pour le questionnaire qui est très formateur.",
      author: "Anonyme",
      position: "(Gestionnaire de patrimoine société ESSET HUMAKEY)",
      height: 180),
  Testimonial(
      text: "Formateur professionnel et pédagogue.",
      author: "Anonyme",
      position: "(Technicien maintenance société TVGO)",
      height: 180),
  Testimonial(
      text: "Parfait, animateur excellent !",
      author: "Anonyme",
      position: "(Ingénieur société SANOFI)",
      height: 180),
];

final List<MenuItem> menuData = [
  MenuItem(
    icon: const Icon(
      Icons.home,
    ),
    title: 'Accueil',
  ),
  MenuItem(
    icon: const Icon(
      Icons.group,
    ),
    title: 'Qui Sommes Nous ?',
  ),
  MenuItem(
      icon: const Icon(
        Icons.mail,
      ),
      title: 'Nous Contacter')
];

final List<TrainingData> trainingData = [
  TrainingData(
      trainingTitle: "Habilitation électrique BT/HT : NFC 18-510",
      trainingImagePath: "assets/images/image_bt_ht.webp",
      description:
          "L’article 4544-9 du code du travail précise que : « Les opérations sur les installations électriques ou dans leur voisinage ne peuvent être effectuées que par des travailleurs habilités. »\nL'article R. 4544-10 du même code prévoit que : « Un travailleur est habilité dans les limites des attributions qui lui sont confiées.",
      certifications: [
        CertificationData(
          name: "B0/H0 – H0V",
          description: "à destination des non électriciens",
        ),
        CertificationData(
          name: "BS/BE Manœuvre",
        ),
        CertificationData(
          name: "BR/BC/B1V/B2V/BE Essai – Vérification – Mesurage",
        ),
        CertificationData(
          name: "HC/H1V/H2V/HE Essai – Vérification – Mesurage",
        )
      ]),
  TrainingData(
      trainingTitle: "Habilitation véhicule électrique: NFC 18-550",
      trainingImagePath: "assets/images/image_vehicule.webp",
      description:
          "La norme NFC-18-550 définit les différents symboles d’habilitation en fonction, entre autres, de la nature de l’opération et de l’environnement électrique.",
      certifications: [
        CertificationData(
          name: "B0L",
        ),
        CertificationData(
          name: "B1VL/B2VL / BCL/ BEL ESSAI/BRL/B1XL/B2XL",
        ),
      ]),
  TrainingData(
      trainingTitle:
          "AIPR (autorisation d’intervention à proximité des réseaux) pour les opérateurs – encadrants et concepteurs",
      description:
          "Obligatoire depuis le 1er janvier 2018, cette formation vous permet d’acquérir des compétences et des connaissances dans la préparation ou l'exécution de travaux à proximité des réseaux.",
      trainingImagePath: "assets/images/image_aipr.webp",
      certifications: []),
  TrainingData(
      trainingTitle:
          "ATEX (Atmosphère explosive):  sensibilisation au risque ATEX",
      trainingImagePath: "assets/images/image_atex.webp",
      description:
          "Les dispositions du Code du travail imposent plusieurs obligations aux employeurs vis-à-vis du risque d’atmosphères explosives à savoir : viser l’application des principes généraux de la prévention des risques,l’évaluation des risques d’explosion, le classement des lieux de travail (zonage) et la rédaction du document relatif à la protection contre les explosions (DRPCE).",
      certifications: []),
  TrainingData(
      trainingTitle: "SST (Sauvetage secourisme du travail)",
      trainingImagePath: "assets/images/image_sst.webp",
      description:
          "Cette formation vise à acquérir des compétences reconnues pour secourir en cas d’accident et pour être acteur de la prévention dans son entreprise.",
      certifications: []),
  TrainingData(
      trainingTitle: "Manutentions manuelles: Gestes et postures",
      description:
          "Cette formation vise à connaître les techniques, théoriques et pratiques, de manutention manuelle et appliquer les bons gestes et bonnes postures à son poste.",
      trainingImagePath: "assets/images/image_manutention.webp",
      certifications: []),
  TrainingData(
      trainingTitle:
          "IRVE (Infrastructure de recharge pour véhicule électrique)",
      trainingImagePath: "assets/images/image_irve.webp",
      description:
          "La formation IRVE (Infrastructure de Recharge pour Véhicule Électrique) enseigne l'installation, la maintenance et la sécurité des bornes de recharge. Les participants apprennent les normes techniques, les réglementations en vigueur, et les bonnes pratiques pour assurer un service fiable et sécurisé. Cette formation est essentielle pour développer des infrastructures de recharge efficaces et conformes.",
      certifications: [
        CertificationData(
          name:
              "IRVE – formation de niveau 1 :\nInstallation de bornes de charges\n",
          description:
              "Cette formation vise l’installation de bornes de charge, sans configuration spécifique pour la communication ou la supervision.",
        ),
        CertificationData(
          name:
              "IRVE – formation de niveau 2 :\nInstallation, configuration et supervision des bornes communicantes\n",
          description:
              "Cette formation vise l’installation d’infrastructures de recharge en AC, avec configuration spécifique pour la communication ou la supervision.",
        ),
        CertificationData(
          name:
              "IRVE – formation de niveau 3 :\nInstallation d’infrastructure de recharge à haute puissance",
          description:
              "Cette formation vise l’installation d’infrastructure de recharge de véhicule électrique en charge rapide à haute puissance et en courant continu (DC) et de connaître les spécificités de ce type d’installations et les règles de sécurité applicables.",
        ),
      ]),
  TrainingData(
      trainingTitle: "Gestion et prévention du risque Chimique",
      trainingImagePath: "assets/images/image_chimique.webp",
      certifications: [],
      description:
          "Article R4412-1 : Détermine que les règles de prévention des risques chimiques sont fixées par décret en Conseil d'État, prenant en compte les situations de polyexpositions."),
  TrainingData(
      trainingTitle: "Risque amiante",
      trainingImagePath: "assets/images/image_amiante.webp",
      description:
          "Dans les bâtiments construits avant 1997, l'amiante est présente partout et constitue un problème majeur de santé publique et de santé au travail: ce matériau aux multiples qualités s'est révélé hautement toxique. Il a été massivement utilisé et le nombre de cancers qu'il a induits ne cesse d'augmenter. Interdit en France depuis 1997, il reste présent dans de nombreux bâtiments et équipements. Dans les bâtiments construits avant 1997, l’amiante est présente partout.",
      certifications: [
        CertificationData(
          name:
              "Sous-section 3 :\nCette section vise le retrait ou le confinement de matériaux contenant de l'amiante.\n",
          // description: "Cette section vise le retrait ou le confinement de matériaux contenant de l'amiante.",
        ),
        CertificationData(
          name:
              "Sous-section 4 :\nCette section concerne les interventions de maintenance, de réparation ou encore d'entretien.",
          // description: "Cette section concerne les interventions de maintenance, de réparation ou encore d'entretien."
        ),
      ]),
];

const mobileWidthLimit = 425.0;
const tabletWidthLimit = 850.0;
const desktopWidthLimit = 1480.0;

const mobilePadding = EdgeInsets.all(12);
const tabletPadding = EdgeInsets.all(24);
const desktopPadding = EdgeInsets.all(32);
