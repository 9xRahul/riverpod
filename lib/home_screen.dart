import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'slider_provider.dart';
import 'search_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StateNotifier"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(query: value);
            },
          ),
          Consumer(builder: (context, ref, child) {
            final search =
                ref.watch((searchProvider).select((state) => state.search));
            return Text(search);
          }),
          Consumer(builder: (context, ref, child) {
            final isChanged =
                ref.watch((searchProvider).select((state) => state.isChanged));
            return Switch(
              value: isChanged,
              onChanged: (value) {
                ref.read(searchProvider.notifier).isChanged(isChanged: value);
              },
            );
          })
        ],
      ),
    );
  }
}

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Riverpod"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [],
//         ),
//       ),
//     );
//   }
// }
