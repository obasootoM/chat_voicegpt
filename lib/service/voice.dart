import 'dart:async';

import 'package:speech_to_text/speech_to_text.dart';

class VoiceAuth {
  final SpeechToText _speechToText = SpeechToText();
  bool isEnabled = false;

  void initspeech() async {
    isEnabled = await _speechToText.initialize();
  }

  Future<String> listening() async {
    final listen = Completer<String>();
    _speechToText.listen(onResult: (result) {
      if (result.finalResult) {
        listen.complete(result.recognizedWords);
      }
    });
    return listen.future;
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
  }

  SpeechToText get speechToText => _speechToText;
  bool get isEnable => isEnabled;
}
