import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/item.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItem({required String itemName}) {
    final item = Item(id: DateTime.now().toString(), name: itemName);
    state.add(item);
    state = state.toList();
  }

  void deleteItem({required String id}) {
    state.removeWhere((item) => item.id == id);
    state = state.toList();
  }

  void updateitem({required String id, required String updatedName}) {
    int index = state.indexWhere((item) => item.id == id);
    state[index].name = updatedName;
    state = state.toList();
  }
}
