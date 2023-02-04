import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_constance/app_constance.dart';
import 'package:news_app/presentation/controller/news_bloc.dart';
import 'package:news_app/presentation/controller/news_event.dart';

class ErrorComponent extends StatelessWidget {
  final String message;
  final NewsEvent event;
  const ErrorComponent({super.key, required this.message, required this.event});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 70,
            color: Colors.red[700],
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  vertical: AppSize.height * 0.05,
                  horizontal: AppSize.width * 0.1),
              child: Text(message)),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: IconButton(
                onPressed: () {
                  BlocProvider.of<NewsBloc>(context).add(event);
                },
                icon: const Icon(Icons.replay)),
          )
        ],
      ),
    );
  }
}
