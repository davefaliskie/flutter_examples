import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Image Example"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            ClipOval(
              child: Image.asset(
                "assets/images/Roads.png",
                height: 100,
              ),
            ),
            const Text("Asset Image"),
            const SizedBox(height: 30.0),

            // Network Image
            SizedBox(
              height: 200,
              child: Image.network(
                "https://roadsaudioassets.s3.amazonaws.com/RoadsShareLink.jpg",
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.error,
                    size: 50,
                    color: Colors.red,
                  );
                },
              ),
            ),
            const Text("Network Image"),

            const SizedBox(height: 30.0),

            SizedBox(
              height: 200,
              child: CachedNetworkImage(
                imageUrl:
                    "https://roadsaudioassets.s3.amazonaws.com/RoadsShareLink.jpg",
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const Text("Cached Network Image"),
          ],
        ),
      ),
    );
  }
}
