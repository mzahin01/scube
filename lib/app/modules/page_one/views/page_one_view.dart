import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/page_one_controller.dart';

class PageOneView extends GetView<PageOneController> {
  const PageOneView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageOneView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PageOneView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
