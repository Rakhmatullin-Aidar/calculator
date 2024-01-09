import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/di/injection_container.dart';
import 'features/home/presentation/pages/home_screen.dart';

void main() async{
  await initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );
  }
}
