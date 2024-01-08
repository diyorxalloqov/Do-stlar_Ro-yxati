import 'package:flutter/material.dart';
import 'package:friends_list/view/pages/friends_page.dart';
import 'package:friends_list/view/pages/new_friend_add_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Do’stlar Ro’yxati"),
      ),
      // body: Column(
      //   children: [],
      // ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Friends()));
              },
              label: const Text("Do’stlarim"),
            ),
            const SizedBox(),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewFriendsAdd()));
              },
              label: const Text("Yangi Do’st Qo’shish"),
            )
          ],
        ),
      ),
    );
  }
}
