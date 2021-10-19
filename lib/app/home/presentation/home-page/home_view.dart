// ignore_for_file: use_key_in_widget_constructors

import 'package:assignment/app/home/presentation/home-page/view/widget/search_bar.dart';
import 'package:assignment/core/app_theme/app_theme.dart';
import 'package:assignment/core/app_theme/core_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_controller.dart';
import 'home_state_machine.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends ResponsiveViewState<HomeView, HomeController> {
  HomeViewState() : super(HomeController());
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<HomeController>(
      builder: (BuildContext context, controller) {
        final currentStateType = controller.getCurrentState().runtimeType;
        switch (currentStateType) {
          case HomeInitState:
            return Scaffold(
              body: Column(
                children: [
                  const SizedBox(height: CoreTheme.spaceSizeExtremeLarge),
                  SearchBarWidget(
                    textEditingController: _textEditingController,
                    controller: controller,
                  ),
                ],
              ),
            );
          case HomeLoadingState:
            return Scaffold(
              body: Column(
                children: [
                  const SizedBox(height: CoreTheme.spaceSizeExtremeLarge),
                  SearchBarWidget(
                    textEditingController: _textEditingController,
                    controller: controller,
                  ),
                  const CircularProgressIndicator(),
                ],
              ),
            );

          case HomeErrorState:
            HomeErrorState errorState =
                controller.getCurrentState() as HomeErrorState;
            return Scaffold(
              body: Column(
                children: [
                  const SizedBox(height: CoreTheme.spaceSizeExtremeLarge),
                  SearchBarWidget(
                    textEditingController: _textEditingController,
                    controller: controller,
                  ),
                  Expanded(child: Container()),
                  Text('${errorState.errorMsg} ',
                      style: AppTheme.textStyleSmall)
                ],
              ),
            );

          case HomeInitializedState:
            HomeInitializedState initializedState =
                controller.getCurrentState() as HomeInitializedState;
            return Scaffold(
              body: Column(
                children: [
                  const SizedBox(height: CoreTheme.spaceSizeExtremeLarge),
                  SearchBarWidget(
                    textEditingController: _textEditingController,
                    controller: controller,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.navigateToDetailPage(
                          movie: initializedState.movieDetailEntity);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: CoreTheme.spaceSizeMedium),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      CoreTheme.spaceSizeSmall,
                                    ),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      initializedState
                                          .movieDetailEntity.metaData.posterUrl,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 105,
                                margin: const EdgeInsets.all(
                                    CoreTheme.spaceSizeSmall),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: CoreTheme.spaceSizeSmall,
                                    vertical: CoreTheme.spaceSizeSmall),
                                decoration: const BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      CoreTheme.spaceSizeSmall,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: CoreTheme.textColor,
                                      size: 18,
                                    ),
                                    Text(
                                      '  ${initializedState.movieDetailEntity.metaData.imdbRating} / 10',
                                      style: AppTheme.textStyleSmall.copyWith(
                                        color: CoreTheme.textColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: CoreTheme.spaceSizeSmall),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: CoreTheme.spaceSizeMedium),
                            child: Text(
                              initializedState.movieDetailEntity.metaData.title,
                              style: AppTheme.textStyleHeading,
                            ),
                          ),
                          const SizedBox(height: CoreTheme.spaceSizeSmall),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: CoreTheme.spaceSizeMedium),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/images/Group 356.svg',
                                    width: 20),
                                const SizedBox(width: CoreTheme.spaceSizeSmall),
                                Text(
                                  '${initializedState.movieDetailEntity.metaData.duration.hours} hours ${initializedState.movieDetailEntity.metaData.duration.minutes} minute',
                                  style: AppTheme.textStyleSmall.copyWith(
                                      color: CoreTheme.secondaryColor),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
        throw Exception("Unrecognized state $currentStateType encountered");
      },
    );
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
