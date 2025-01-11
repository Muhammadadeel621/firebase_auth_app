import 'package:assignfirebaseauthapp/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Expanded list data
  final List<Map<String, String>> items = List.generate(20, (index) {
    return {
      "title": "Item $index",
      "subtitle": "Description for item $index.",
      "image":
          "https://picsum.photos/id/${index + 10}/150/150" // Using Picsum for dynamic images
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          SpaceCustomWidget(
            width: 10,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                items[index]["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            title: Text(items[index]["title"]!),
            subtitle: Text(items[index]["subtitle"]!),
            onTap: () {
              // Handle item tap
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Tapped on ${items[index]['title']}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
