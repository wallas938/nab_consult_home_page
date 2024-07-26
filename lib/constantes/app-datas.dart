import 'package:flutter/material.dart';

class MenuItem {
  final Icon icon;
  final String title;
  final VoidCallback onTap;

  MenuItem({required this.icon, required this.title, required this.onTap});
}

class TrainingData {
  final String trainingName;
  final String trainingImagePath;
  final List<CertificationData> certifications;
  final String? description;
  final String? duration;

  TrainingData(
      {this.description,
      this.duration,
      required this.trainingName,
      required this.trainingImagePath,
      required this.certifications});
}

class CertificationData {
  final String name;
  final String? duration;
  final String? description;

  CertificationData({required this.name, this.duration, this.description});
}

List<MenuItem> menuData = [
  MenuItem(
      icon: const Icon(
        Icons.home,
      ),
      title: 'Accueil',
      onTap: () {}),
  MenuItem(
      icon: const Icon(
        Icons.group,
      ),
      title: 'Qui Sommes Nous ?',
      onTap: () {}),
  MenuItem(
      icon: const Icon(
        Icons.mail,
      ),
      title: 'Nous Contacter',
      onTap: () {})
];

List<TrainingData> trainingData = [
  TrainingData(
      trainingName: "Habilitation électrique BT/HT : NFC 18-510",
      trainingImagePath: "assets/images/image_bt_ht.webp",
      certifications: [
        CertificationData(
            name: "B0/H0 – H0V => à destination des non électriciens;",
            duration: "1"),
        CertificationData(name: "BS/BE Manœuvre"),
        CertificationData(
            name: "BR/BC/B1V/B2V/BE Essai – Vérification – Mesurage"),
        CertificationData(name: "HC/H1V/H2V/HE Essai – Vérification – Mesurage")
      ]),
  TrainingData(
      trainingName: "Habilitation véhicule électrique: NFC 18-550",
      trainingImagePath: "assets/images/image_vehicule.webp",
      certifications: [
        CertificationData(name: "B0L;"),
        CertificationData(name: "B1VL/B2VL / BCL/ BEL ESSAI/BRL"),
        CertificationData(
            name: "BR/BC/B1V/B2V/BE Essai – Vérification – Mesurage"),
        CertificationData(name: "B1XL/B2XL")
      ]),
  TrainingData(
      trainingName:
          "AIPR (autorisation d’intervention à proximité des réseaux) pour les opérateurs – encadrants et concepteurs",
      trainingImagePath: "assets/images/image_aipr.webp",
      certifications: []),
  TrainingData(
      trainingName:
          "ATEX (Atmosphère explosive):  sensibilisation au risque ATEX",
      trainingImagePath: "assets/images/image_atex.webp",
      certifications: []),
  TrainingData(
      trainingName: "SST (Sauvetage secourisme du travail)",
      trainingImagePath: "assets/images/image_sst.webp",
      certifications: []),
  TrainingData(
      trainingName: "Manutentions manuelles: Gestes et postures",
      trainingImagePath: "assets/images/image_manutention.webp",
      certifications: []),
  TrainingData(
      trainingName:
          "IRVE (Infrastructure de recharge pour véhicule électrique)",
      trainingImagePath: "assets/images/image_irve.webp",
      certifications: [
        CertificationData(
            name: "IRVE – formation de niveau 1",
            description:
                "ette formation vise l’installation de bornes de charge, sans configuration spécifique pour la communication ou la supervision."),
        CertificationData(
            name: "IRVE – formation de niveau 2",
            description:
                "Cette formation vise l’installation d’infrastructures de recharge en AC, avec configuration spécifique pour la communication ou la supervision."),
        CertificationData(
            name:
                "IRVE – formation de niveau 3 Charge Rapide ou à haute puissance",
            description:
                "ette formation vise l’installation d’infrastructure de recharge de véhicule électrique en charge rapide à haute puissance et en courant continu (DC) et de connaître les spécificités de ce type d’installations et les règles de sécurité applicables."),
      ]),
];
