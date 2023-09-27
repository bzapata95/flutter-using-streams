import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../domain/models/notification.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const Scaffold()),
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      // body: ListView.builder(
      //   itemBuilder: (_, index) {
      //     final notification = _list[index];
      //     return ListTile(
      //       title: Text(notification.title),
      //       subtitle: Text(notification.body),
      //     );
      //   },
      //   itemCount: _list.length,
      // ),
      body: SizedBox(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<AppNotification>(
              stream:
                  Provider.of(context).notificationsRepository.onNotification,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return ListTile(
                    title: Text(snapshot.data!.title),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }),
        ],
      )),
    );
  }
}
