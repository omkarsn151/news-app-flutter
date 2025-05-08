import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/features/news/bloc/news_bloc.dart';
import 'package:news_app_flutter/features/news/bloc/news_event.dart';

class SomethingWentWrongWidget extends StatelessWidget {
  const SomethingWentWrongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Icon(
            Icons.error_outline,
            size: 60,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16),
        Text(
          "Something went wrong",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Please try again later",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
            onPressed: () {
              context.read<NewsBloc>().add(FetchNews());
            },
            child: const Text("Retry", style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
