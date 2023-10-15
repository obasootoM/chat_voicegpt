import 'package:chat_voicegpt/model/chat_model.dart';
import 'package:chat_voicegpt/provider/chat_provider.dart';
import 'package:chat_voicegpt/service/chat_service.dart';
import 'package:chat_voicegpt/service/voice.dart';
import 'package:chat_voicegpt/features/widget/toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum InputMode { text, voice }

class CustomField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  const CustomField({super.key, required this.controller});

  @override
  ConsumerState<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends ConsumerState<CustomField> {
  ChatApi chatApi = ChatApi();
  final VoiceAuth voiceAuth = VoiceAuth();
  var isLoading = false;

  InputMode inputMode = InputMode.voice;
  void setInputmode(InputMode input) {
    setState(() {
      inputMode = input;
    });
  }

  @override
  void initState() {
    voiceAuth.initspeech();
    super.initState();
  }

  void sendTextMessages(String text) async {
    setIsReply(true);
    addToList(text, true, DateTime.now().toString());
    // addToList('Typing...', false, 'typing');
    setInputmode(InputMode.voice);
    final aiResponse = await chatApi.getResponse(text);
    addToList(aiResponse, false, DateTime.now().toString());

    setIsReply(false);
  }

  void addToList(String text, bool isMe, String id) {
    final chat = ref.read(chatProvider.notifier);
    chat.add(Model(isMe: isMe, message: text, id: DateTime.now().toString()));
  }

  void setIsReply(bool isReply) {
    setState(() {
      isLoading = isReply;
    });
  }

  void removeTyping() {
    final chat = ref.read(chatProvider.notifier);
    chat.isRemoving();
  }

  void sendVoiceMessages() async {
    if (voiceAuth.speechToText.isListening) {
      await voiceAuth.stopListening();
    } else {
      final start = await voiceAuth.listening();
      sendTextMessages(start);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
          onChanged: (value) {
            value.isNotEmpty
                ? setInputmode(InputMode.text)
                : setInputmode(InputMode.voice);
          },
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: 'type here',
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
      )),
      Toggle(
        isReplying: isLoading,
        inputMode: inputMode,
        sendMessage: () {
          final message = widget.controller.text;
          widget.controller.clear();
          sendTextMessages(message);
        },
        voiceMessage: () {
          sendVoiceMessages();
        },
      )
    ]);
  }
}
