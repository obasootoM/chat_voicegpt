import 'package:chat_voicegpt/provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Twitch extends ConsumerStatefulWidget {
  const Twitch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TwitchState();
}

class _TwitchState extends ConsumerState<Twitch> {
  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
        activeColor: Theme.of(context).colorScheme.secondary,
        value: ref.watch(providerService) == Themes.dark,
        onChanged: (value) {
          ref.read(providerService.notifier).state =
              value ? Themes.dark : Themes.light;
        });
  }
}
