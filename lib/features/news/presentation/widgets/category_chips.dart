import 'package:flutter/material.dart';
import 'package:news_app_flutter/core/constants/common_widgets/custom_text.dart';
import 'package:news_app_flutter/features/news/presentation/screens/news_by_category_list_screen.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
    State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  final List<String> categories = ['Sports', 'Business', 'Politics', 'Stocks', 'Entertainment', 'Crime'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsByCategoryListScreen(category: category,),)),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: CustomText(text: category),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
