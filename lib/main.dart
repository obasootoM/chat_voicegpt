import 'package:chat_voicegpt/constant/constant.dart';
import 'package:chat_voicegpt/features/splash_screen/splash_screen.dart';
import 'package:chat_voicegpt/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionProvider = ref.watch(providerService);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: actionProvider == Themes.dark ? ThemeMode.dark : ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
