import 'package:daveknows/models/DKSharedModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DKSharedModelProvider>(
      builder: (context, dkSharedModelProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Welcome'),
          ),
          body: Center(
            child: Text(
              'Loaded YAML File: ${dkSharedModelProvider.dkSharedModel.env.toString()}',
              style: const TextStyle(fontSize: 12),
            ),
          ),
        );
      },
    );
  }
}