import 'package:flutter/material.dart';

import 'character_list_view.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Characters')),
        resizeToAvoidBottomInset: false,
        body: const CharacterListView(),
      );
}
