import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? child;
  final TabController? tabController;

  const CustomScaffold({super.key, this.child, this.tabController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: tabController != null
            ? TabBar(
          controller: tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
          tabs: const [
            Tab(text: "Pizza"),
            Tab(text: "Salad"),
            Tab(text: "Dessert"),
            Tab(text: "Sides"),
          ],
        )
            : null,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: child!,
          ),
        ],
      ),
    );
  }
}
