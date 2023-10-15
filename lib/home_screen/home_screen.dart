import 'package:chat_voicegpt/constant/custom_field.dart';
import 'package:chat_voicegpt/provider/chat_provider.dart';
import 'package:chat_voicegpt/widget/app_bar.dart';
import 'package:chat_voicegpt/widget/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  final isLoading = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(children: [
        Expanded(child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final chat = ref.watch(chatProvider);
          return ListView.builder(
              itemCount: chat.length,
              itemBuilder: (context, index) => ChatMessage(
                  text: chat[index].message, isMe: chat[index].isMe));
        })),
        if(isLoading) ...[
         const  SpinKitThreeBounce(
            color: Colors.white,
            size: 18,
          )
        ],
        const SizedBox(height: 20,),
        CustomField(
          controller: controller,
        )
      ]),
    );
  }
}
