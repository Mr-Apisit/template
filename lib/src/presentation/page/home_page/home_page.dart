import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:templates/src/presentation/page/home_page/widgets/body_widget.dart';
import 'package:templates/src/presentation/provider/menu_tile_provider.dart';
import '/src/presentation/utils/layout_manager.dart';
import 'widgets/title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MenuTile>(
        create: (context) => MenuTile(),
        builder: (context, state) {
          return const LayoutManager(
            mobileLayout: _Mobile(),
            desktopLayout: _Desktop(),
          );
        });
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const TitleWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 2.5),
              child: SizedBox(
                  height: 20,
                  child: Divider(
                    thickness: 2,
                    color: Colors.blueGrey.withOpacity(.3),
                  )),
            ),
            const Expanded(child: BodyWidget()),
          ],
        ),
      ),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scrollbar(
        scrollbarOrientation: ScrollbarOrientation.top,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const TitleWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: SizedBox(
                    height: 70,
                    child: Divider(
                      thickness: 2,
                      color: Colors.blueGrey.withOpacity(.3),
                    )),
              ),
              const SizedBox(height: 40),
              const BodyWidget(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
