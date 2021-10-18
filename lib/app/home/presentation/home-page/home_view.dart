// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'home_controller.dart';
import 'home_state_machine.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends ResponsiveViewState<HomeView, HomeController> {
  HomeViewState() : super(HomeController());

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('HomeInitState'),
                TextButton(
                  onPressed: () {
                    controller.getMovies(name: "");
                  },
                  child: const Text("Find Movie"),
                ),
              ],
            ));
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('HomeErrorState'),
              ),
            );

          case HomeInitializedState:
            HomeInitializedState initializedState =
                controller.getCurrentState() as HomeInitializedState;
            return Scaffold(
              body: Center(
                child: GestureDetector(
                  onTap: () {
                    controller.navigateToDetailPage(
                        movie: initializedState.movieDetailEntity);
                  },
                  child: Card(
                    child:
                        Text(initializedState.movieDetailEntity.metaData.title),
                  ),
                ),
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
