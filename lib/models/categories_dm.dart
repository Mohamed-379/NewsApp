import 'package:flutter/material.dart';

class CategoryDM
{
  Color backgroundColor;
  String title;
  String imagePath;
  bool isLeftSided;
  String id;

  CategoryDM({
    required this.backgroundColor,
    required this.title,
    required this.imagePath,
    required this.isLeftSided,
    required this.id
  });

  static List<CategoryDM> category = [
    CategoryDM(
        backgroundColor: Colors.red,
        title: "Sport",
        imagePath: "assets/images/sports.png",
        isLeftSided: true,
        id: "sports"),
    CategoryDM(
        backgroundColor: const Color(0xff003e8f),
        title: "Technology",
        imagePath: "assets/images/technology0.png",
        isLeftSided: false,
        id: "technology"),
    CategoryDM(
        backgroundColor: Colors.pink,
        title: "Health",
        imagePath: "assets/images/health.png",
        isLeftSided: true,
        id: "health"),
    CategoryDM(
        backgroundColor: const Color(0xffce7d48),
        title: "Business",
        imagePath: "assets/images/bussines.png",
        isLeftSided: false,
        id: "business"),
    CategoryDM(
        backgroundColor: Colors.blue,
        title: "Environment",
        imagePath: "assets/images/environment.png",
        isLeftSided: true,
        id: "entertainment"),
    CategoryDM(
        backgroundColor: const Color(0xfff2ce4d),
        title: "Science",
        imagePath: "assets/images/science.png",
        isLeftSided: false,
        id: "science"),
    CategoryDM(
        backgroundColor: Colors.black,
        title: "General",
        imagePath: "assets/images/general_news.png",
        isLeftSided: true,
        id: "general"),
  ];
}