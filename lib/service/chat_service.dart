import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatApi {
  final openAI = OpenAI.instance.build(
      token: 'type your openai api',
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 20000)),
      enableLog: true);

  // Future<String> getResponse(String text) async {
  //   try {
  //     final request = CompleteText(
  //         maxTokens: 200, prompt: text, model: TextDavinci3Model());
  //     final response = await openAI.onCompletion(request: request);
  //     if (response != null) {
  //       return response.choices[0].text.trim();
  //     }
  //     return 'something bad just happen';
  //   } catch (e) {
  //     print('error $e');
  //     return 'bad request $e';
  //   }
  // }
  Future<String> getResponse(String text) async {
    try {
      final request = ChatCompleteText(
          messages: [Messages(role: Role.user, content: text)],
          maxToken: 200,
          model: GptTurboChatModel());
      final response = await openAI.onChatCompletion(request: request);
      for (var element in response!.choices) {
        return ("${element.message?.content}");
      }
      return 'bad request';
    } catch (e) {
      return 'error $e';
    }
  }
}
