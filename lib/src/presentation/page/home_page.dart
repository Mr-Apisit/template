import 'package:flutter/material.dart';
import '/src/presentation/utils/layout_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutManager(
      mobileLayout: _Mobile(),
      desktopLayout: _Desktop(),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) => Container(
                height: 80,
                color: Colors.amber,
              ),
          separatorBuilder: (context, index) =>
              const SizedBox(width: 180, child: Divider()),
          itemCount: 10),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 320,
            child: ListView.separated(
                itemBuilder: (context, index) => Container(
                      height: 80,
                      color: Colors.amber,
                    ),
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 180, child: Divider()),
                itemCount: 10),
          ),
          Expanded(
              child: Container(
            color: Colors.red,
          )),
        ],
      ),
    );
  }
}
