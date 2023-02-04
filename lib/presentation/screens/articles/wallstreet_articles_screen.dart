import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/utils/app_constance/app_constance.dart';
import 'package:news_app/core/utils/enums.dart';
import 'package:news_app/presentation/components/articels_component.dart';
import 'package:news_app/presentation/components/error_componetnt.dart';
import 'package:news_app/presentation/controller/news_bloc.dart';
import 'package:news_app/presentation/controller/news_event.dart';
import 'package:news_app/presentation/controller/news_state.dart';

class WallStreetArticlesScreen extends StatelessWidget {
  const WallStreetArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      buildWhen: (previous, current) =>
          previous.wallStreetArticlesState != current.wallStreetArticlesState,
      builder: (context, state) {
        switch (state.wallStreetArticlesState) {
          case RequestState.loading:
            return Center(
                child: Lottie.asset("assets/lottie/loading.json",
                    width: AppSize.height * 0.4));

          case RequestState.loaded:
            final articles = state.wallStreetArticles;

            return RefreshIndicator(
              onRefresh: () =>
                  AppFunction.onRefresh(context, GetWallStreetArticlesEvent()),
              child: ArticleComponent(
                articles: articles,
              ),
            );

          case RequestState.error:
            return ErrorComponent(
                event: GetWallStreetArticlesEvent(),
                message: state.wallStreetArticlesMessage);
        }
      },
    );
  }
}
