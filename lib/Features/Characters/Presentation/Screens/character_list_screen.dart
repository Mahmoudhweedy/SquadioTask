import 'package:flutter/material.dart';

import 'character_list_view.dart';

class ActorsListScreen extends StatelessWidget {
  const ActorsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Actors')),
        resizeToAvoidBottomInset: false,
        body: const ActorsListView(),
      );
}
