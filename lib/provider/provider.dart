import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerService = StateProvider<Themes>((ref) => Themes.dark);


enum Themes{
 dark,
 light
}
