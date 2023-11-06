import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:templates/src/presentation/utils/layout_manager.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

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
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height - 120,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              10,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: BodyTile(),
              ),
            ),
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
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              10,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                child: BodyTile(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyTile extends StatelessWidget {
  const BodyTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 320,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.25),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2),
                    child: Text(
                      'Lorem ipsum habitasse',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur. Faucibus sed .......',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white.withOpacity(.75)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
