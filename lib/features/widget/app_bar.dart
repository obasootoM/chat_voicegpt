import 'package:chat_voicegpt/provider/provider.dart';
import 'package:chat_voicegpt/features/widget/twitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Flutter',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
      actions:  [
        Row(
          children: [
            Consumer(
               builder: (context, ref,child) =>
                 Icon(ref.watch(providerService) == Themes.dark ? Icons.dark_mode : Icons.light_mode)
             ),
             const SizedBox(
              width: 10,
            ),
            const  Twitch()
          ],
        )
      ],
    );
  }
  
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
