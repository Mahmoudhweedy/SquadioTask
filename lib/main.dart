import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_task/Features/Characters/Presentation/Provider/actors_provider.dart';

import 'App/DI/dependeny_injection.dart' as di;
import 'Features/Characters/Presentation/Screens/character_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ActorsProvider(
            getAllActorsUsecase: di.sl(), getActorsDetailsUsecase: di.sl()),
        child: MaterialApp(
          title: 'Actors Display',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const CharacterListScreen(),
        ),
      );
}
