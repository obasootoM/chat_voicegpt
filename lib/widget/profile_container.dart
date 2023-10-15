import 'package:flutter/material.dart';
class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.isMe,
  });

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: isMe
              ? Theme.of(context).colorScheme.secondary
              : Colors.grey[500],
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(5),
              topRight: const Radius.circular(5),
              bottomLeft: Radius.circular(isMe ? 0 : 15),
              bottomRight: Radius.circular(isMe ? 15 : 0))),
      child: Icon(isMe ? Icons.person : Icons.computer,
      color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}