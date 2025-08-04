import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/item_provider.dart';
import 'slider_provider.dart';
import 'search_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("StateNotifier"),
      ),
      body: item.isEmpty
          ? Center(child: Text("No data added"))
          : ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                final itemetail = item[index];
                return ListTile(
                  title: Text(itemetail.name),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            ref
                                .read(itemProvider.notifier)
                                .deleteItem(id: itemetail.id);
                          },
                          icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {
                            ref.read(itemProvider.notifier).updateitem(
                                id: itemetail.id, updatedName: "Updated Name");
                          },
                          icon: Icon(Icons.update)),
                    ],
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem(itemName: "New item");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
