import 'package:chat_voicegpt/model/chat_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends StateNotifier<List<Model>> {
  ChatNotifier() : super([]);
  void add(Model model) {
    state = [...state, model];
  }

  void isRemoving() {
    state = state..removeWhere((chat) => chat.id == 'typing');
  }
}

final chatProvider = StateNotifierProvider<ChatNotifier, List<Model>>((ref) {
  return ChatNotifier();
});
