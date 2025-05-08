import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/core/constants/common_widgets/custom_text.dart';
import 'package:news_app_flutter/features/news/bloc/news_bloc.dart';
import 'package:news_app_flutter/features/news/bloc/news_event.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  final List<String> categories = [
    'Top Stories',
    'Sports',
    'Business',
    'Politics',
    'Technology',
    'Entertainment',
    'Health'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                if (index == 0) {
                  BlocProvider.of<NewsBloc>(context).add(FetchNews());
                } else {
                  BlocProvider.of<NewsBloc>(context).add(FetchNewsByCategory(categories[index]));
                }
                
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Colors.deepPurple
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CustomText(
                  text: categories[index],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: selectedIndex == index
                      ? Colors.white
                      : Colors.grey[800],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
