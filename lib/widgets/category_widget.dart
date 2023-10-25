import 'package:flutter/material.dart';
import 'package:news_app/models/categories_dm.dart';

class CategoryWidget extends StatelessWidget {

  CategoryDM categoryDM;
  Radius radius = const Radius.circular(22);
  CategoryWidget({super.key, required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryDM.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: categoryDM.isLeftSided ? Radius.zero : radius,
          bottomRight: !categoryDM.isLeftSided ? Radius.zero : radius
        )
      ),
      child: Column(
        children: [
          const Spacer(),
          Image(image: AssetImage(categoryDM.imagePath), height: MediaQuery.of(context).size.height * .14,),
          const SizedBox(height: 10,),
          Text(categoryDM.title, style: const TextStyle(fontSize: 16, fontFamily: "Poppins", color: Colors.white),),
          const Spacer(),
        ],
      ),
    );
  }
}
