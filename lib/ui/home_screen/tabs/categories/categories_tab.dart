import 'package:flutter/material.dart';
import '../../../../models/categories_dm.dart';
import '../../../../widgets/category_widget.dart';

class CategoriesTab extends StatelessWidget {
  final Function(CategoryDM) onCategoryClick;
  const CategoriesTab(this.onCategoryClick ,{super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14,),
        const Text("Pick your category",
          style: TextStyle(fontFamily: "Poppins", fontSize: 25,fontWeight: FontWeight.bold),),
        const SizedBox(height: 16,),
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.all(14),
              itemCount: CategoryDM.category.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.8/2
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () => onCategoryClick(CategoryDM.category[index]),
                  child: CategoryWidget(categoryDM: CategoryDM.category[index]))
          ),
        ),
      ],
    );
  }
}
