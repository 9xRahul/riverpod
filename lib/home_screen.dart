import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});

final toggle = StateProvider<bool>((ref) {
  return false;
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer(builder: (context, ref, child) {
              final tempCounter = ref.watch(counter);
              return Text(
                "$tempCounter",
                style: TextStyle(fontSize: 20),
              );
            }),
            Consumer(builder: (context, ref, child) {
              final tempToggle = ref.watch(toggle);

              return Switch(
                  value: tempToggle,
                  onChanged: (value) {
                    ref.read(toggle.notifier).state = value;
                  });
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(counter.notifier).state--;
                    },
                    child: Text(
                      "-",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    onPressed: () {
                      ref.read(counter.notifier).state++;
                    },
                    child: Text(
                      "+",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Riverpod"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Consumer(builder: (context, ref, child) {
//               final tempCounter = ref.watch(counter);
//               return Text(
//                 "$tempCounter",
//                 style: TextStyle(fontSize: 20),
//               );
//             }),
//             Consumer(builder: (context, ref, child) {
//               final tempToggle = ref.watch(toggle);

//               return Switch(
//                   value: tempToggle,
//                   onChanged: (value) {
//                     ref.read(toggle.notifier).state = value;
//                   });
//             }),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       ref.read(counter.notifier).state--;
//                     },
//                     child: Text(
//                       "-",
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     )),
//                 ElevatedButton(
//                     onPressed: () {
//                       ref.read(counter.notifier).state++;
//                     },
//                     child: Text(
//                       "+",
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

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
//       body: Text(
//         "days",
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {

//   final days = Provider<int>((ref) {
//     return 10;
//   });
//   @override
//   Widget build(BuildContext context) {
//     final counterValue = ref.watch(counter);
//     final tempDays = ref.watch(days);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Riverpod"),
//       ),
//       body: Text(
//         "$learn in $tempDays days",
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }
