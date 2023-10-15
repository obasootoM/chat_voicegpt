import 'package:chat_voicegpt/constant/custom_field.dart';
import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  final InputMode _inputMode;
  final VoidCallback _sendTextMessage;
  final VoidCallback _voiceMessages;
   final bool _isReplying;
  const Toggle({
    super.key,
    required InputMode inputMode,
    required VoidCallback sendMessage,
    required VoidCallback voiceMessage,
    required bool isReplying
  })  : _inputMode = inputMode,
        _sendTextMessage = sendMessage,
        _voiceMessages = voiceMessage,
   _isReplying = isReplying;

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(10),
            foregroundColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.onSecondary),
        onPressed: 
          widget._isReplying ? null :
             widget._inputMode == InputMode.text
                ? widget._sendTextMessage
                : widget._voiceMessages,
        child:
            Icon(widget._inputMode == InputMode.text ? Icons.send : Icons.mic));
  }
}
