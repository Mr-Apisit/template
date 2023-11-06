import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:templates/src/presentation/utils/layout_manager.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

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
    return Row(
      children: [
        const SizedBox(width: 20),
        // search
        const _SearchBar(),

        //signin button
        IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.arrowRightToBracket),
          ),
        ),
      ],
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            "กิจกรรมทั้งหมด",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        // search
        const _SearchBar(),

        //signin button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextButton(
              onPressed: () {},
              child: Text(
                "เข้าสู่ระบบ",
                style: Theme.of(context).textTheme.headlineSmall,
              )),
        )
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26, width: 1.5),
            borderRadius: BorderRadius.circular(7),
          ),
          child: TextField(
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration.collapsed(
              hintText: 'ค้นหากิจกรรม',
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[400]),
            ),
          ),
        ),
      ),
    );
  }
}
