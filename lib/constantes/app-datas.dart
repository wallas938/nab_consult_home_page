import 'package:flutter/material.dart';

class MenuItem {
  final Icon icon;
  final String title;
  final VoidCallback onTap;

  MenuItem({required this.icon, required this.title, required this.onTap});
}

class TrainingData {
  final String trainingTitle;
  final String trainingImagePath;
  final List<CertificationData> certifications;
  final String? description;
  final String? duration;

  TrainingData(
      {this.description,
      this.duration,
      required this.trainingTitle,
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
      trainingTitle: "Habilitation électrique BT/HT : NFC 18-510",
      trainingImagePath: "assets/images/image_bt_ht.webp",
      description:
          "Les certifications électriques garantissent la conformité aux normes de sécurité, protègent les employés et les clients, et renforcent la réputation de l'entreprise. Elles sont essentielles pour assurer la légalité, la sécurité, et la compétitivité sur le marché.",
      certifications: [
        CertificationData(
          name: "B0/H0 – H0V",
          description: "à destination des non électriciens",
          duration: "1",
        ),
        CertificationData(name: "BS/BE Manœuvre", duration: "2"),
        CertificationData(
            name: "BR/BC/B1V/B2V/BE Essai – Vérification – Mesurage",
            duration: "3"),
        CertificationData(
            name: "HC/H1V/H2V/HE Essai – Vérification – Mesurage",
            duration: "3")
      ]),
  TrainingData(
      trainingTitle: "Habilitation véhicule électrique: NFC 18-550",
      trainingImagePath: "assets/images/image_vehicule.webp",
      description:
          "Les véhicules électriques fonctionnent sous haute tension (400-700V), ce qui présente des risques d'électrocution et de brûlures. Les interventions sur ces véhicules nécessitent une formation spécifique et des précautions particulières. Les employeurs sont tenus de former leurs salariés et de leur délivrer une habilitation pour travailler sur des véhicules électriques, conformément au code du travail.",
      certifications: [
        CertificationData(name: "B0L"),
        CertificationData(name: "B1VL/B2VL/BCL/BEL ESSAI/BRL"),
        CertificationData(
            name: "BR/BC/B1V/B2V/BE Essai – Vérification – Mesurage"),
        CertificationData(name: "B1XL/B2XL")
      ]),
  TrainingData(
      trainingTitle:
          "AIPR (autorisation d’intervention à proximité des réseaux) pour les opérateurs – encadrants et concepteurs",
      description:
          "Depuis le 1er janvier 2018, l’Autorisation d’Intervention à Proximité des Réseaux (AIPR) est obligatoire pour toute personne travaillant près de réseaux aériens ou enterrés. Délivrée par l’employeur, elle certifie les compétences nécessaires pour éviter les dommages aux infrastructures. L'AIPR, conforme à la réglementation DT-DICT, vise à améliorer la sécurité et prévenir les incidents.",
      trainingImagePath: "assets/images/image_aipr.webp",
      duration: "1",
      certifications: []),
  TrainingData(
      trainingTitle:
          "ATEX (Atmosphère explosive):  sensibilisation au risque ATEX",
      trainingImagePath: "assets/images/image_atex.webp",
      description:
          "Les dispositions du Code du travail imposent plusieurs obligations aux employeurs vis-à-vis du risque d’atmosphères explosives : l’application des principes généraux de la prévention des risques,l’évaluation des risques dont le risque d’explosion,le classement des lieux de travail (zonage),la rédaction du document relatif à la protection contre les explosions (DRPCE). ",
      certifications: []),
  TrainingData(
      trainingTitle: "SST (Sauvetage secourisme du travail)",
      duration: "2",
      trainingImagePath: "assets/images/image_sst.webp",
      description:
          "Tout salarié peut se former au sauvetage secourisme du travail. Il acquiert ainsi des compétences reconnues pour secourir en cas d’accident et pour être acteur de la prévention dans son entreprise",
      certifications: []),
  TrainingData(
      trainingTitle: "Manutentions manuelles: Gestes et postures",
      description:
          "La formation SST (Sauvetage Secourisme du Travail) enseigne les techniques de premiers secours et la prévention des risques professionnels. Les participants apprennent à évaluer les situations d'urgence, à effectuer les gestes de secours nécessaires et à alerter les secours. Elle est essentielle pour assurer la sécurité des employés et minimiser les conséquences des accidents au travail.",
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
            name: "IRVE – formation de niveau 1",
            description:
                "Cette formation vise l’installation de bornes de charge, sans configuration spécifique pour la communication ou la supervision.",
            duration: "1"),
        CertificationData(
            name: "IRVE – formation de niveau 2",
            description:
                "Cette formation vise l’installation d’infrastructures de recharge en AC, avec configuration spécifique pour la communication ou la supervision.",
            duration: "2"),
        CertificationData(
            name:
                "IRVE – formation de niveau 3 Charge Rapide ou à haute puissance",
            description:
                "Cette formation vise l’installation d’infrastructure de recharge de véhicule électrique en charge rapide à haute puissance et en courant continu (DC) et de connaître les spécificités de ce type d’installations et les règles de sécurité applicables.", duration: "3"),
      ]),
];
