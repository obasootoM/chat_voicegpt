import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_voicegpt/features/widget/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;
  const ChatMessage({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ProfileContainer(isMe: isMe),
          if (!isMe)
            const SizedBox(
              width: 20,
            ),
          Container(
            padding: const EdgeInsets.all(15),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.60),
            decoration: BoxDecoration(
                color: isMe
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey[500],
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(5),
                    topRight: const Radius.circular(5),
                    bottomLeft: Radius.circular(isMe ? 0 : 15),
                    bottomRight: Radius.circular(isMe ? 15 : 0))),
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return DefaultTextStyle(
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),
                    child: AnimatedTextKit(
                      repeatForever: false,
                      isRepeatingAnimation: false,
                      displayFullTextOnTap: true,
                      totalRepeatCount: 1,
                      animatedTexts: [
                       TyperAnimatedText(text)
                      ],
                    ));
              },
            ),
          ),
          if (isMe)
            const SizedBox(
              width: 20,
            ),
          if (isMe) ProfileContainer(isMe: isMe),
        ],
      ),
    );
  }
}
