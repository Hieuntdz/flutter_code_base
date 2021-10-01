import 'package:flutter/material.dart';

import 'package:flutter_code_base/constants/constants.dart';
import 'package:flutter_code_base/core/core.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const AppScaffold<MainBloc>(
      title: 'Home ABC',
      body: HomeWidget(),
      showBackButton: false,
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteConstants.api);
              },
              child: const Text(ButtonConstatns.api)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteConstants.cached);
              },
              child: const Text(ButtonConstatns.cached))
        ],
      ),
    );
  }
}
