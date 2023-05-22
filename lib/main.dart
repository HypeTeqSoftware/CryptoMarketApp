import 'package:crypto_app/constants/app_strings.dart';
import 'package:crypto_app/constants/global_context.dart';
import 'package:crypto_app/provider/api_service.dart';
import 'package:crypto_app/provider/charts_provider.dart';
import 'package:crypto_app/provider/stream_provider.dart';
import 'package:crypto_app/screens/on_board/on_board_screen.dart';
import 'package:crypto_app/widget/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => APIServiceProvider()),
        ChangeNotifierProvider(create: (context) => StreamsProvider()),
        ChangeNotifierProvider(create: (context) => ChartsProvider()),
      ],
      child: MaterialApp(
        title: AppString.appName,
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: ShowSnackBar.messengerKey,
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: "Vollkorn"
        ),
        home: const OnBoardScreen()
      ),
    );
  }
}

