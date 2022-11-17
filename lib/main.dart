import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const borderRadius = Radius.circular(8);
const avatarSize = 113.0;
const horizontalPadding = 40.0;
const verticalPadding = 25.0;
const menu = [
  "Blog",
  "Projects",
  "Experience",
  "About",
  "Contacts",
];
const animationDuration = Duration(milliseconds: 365);
final menuController = ValueNotifier(0);

void main() {
  runApp(
    MediaQuery.fromWindow(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(builder: (context) {
          return ColoredBox(
            color: context.backGroundColor,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(borderRadius),
                color: context.accentColor,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Header(),
                  ),
                  SliverToBoxAdapter(
                    child: Menu(),
                  ),
                  SliverFillRemaining(
                    child: ValueListenableBuilder<int>(
                      valueListenable: menuController,
                      builder: (context, value, _) {
                        return AnimatedSwitcher(
                          duration: animationDuration,
                          child: ListView.builder(
                            key: UniqueKey(),
                            itemCount: 1000,
                            itemBuilder: (_, index) {
                              print(index);
                              return const Text(
                                "213",
                                style: TextStyle(fontSize: 50),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    ),
  );
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 88),
        scrollDirection: Axis.horizontal,
        itemCount: menu.length,
        itemBuilder: (_, index) {
          final title = menu[index];
          return ValueListenableBuilder<int>(
              valueListenable: menuController,
              builder: (context, value, _) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    // color: Colors.blue,
                    key: ValueKey(title),
                    onPressed: () => menuController.value = index,
                    child: Text(
                      title,
                      style: context.m1(active: value == index),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Row(
        children: [
          const SizedBox.square(
            dimension: avatarSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/avatar.jpg'),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daniel Surnin",
                  style: context.h1,
                ),
                const SizedBox(height: 5),
                Text("Mobile applications enjoyer", style: context.h2),
                const SizedBox(height: 15),
                Row(
                  children: [
                    TextButton(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 20,
                            color: context.secondaryTextColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Tivat, Montenegro",
                            style: context.h3,
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.work_outline_rounded,
                            size: 20,
                            color: context.secondaryTextColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Picnic",
                            style: context.h3,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension Decorations on BuildContext {
  Color get backGroundColor => MediaQuery.of(this).platformBrightness == Brightness.light
      ? const Color.fromRGBO(230, 230, 230, 1)
      : const Color.fromRGBO(30, 30, 30, 1);

  Color get accentColor => MediaQuery.of(this).platformBrightness == Brightness.light
      ? const Color.fromRGBO(246, 246, 246, 1)
      : const Color.fromRGBO(40, 40, 40, 1);

  Color get textColor => MediaQuery.of(this).platformBrightness == Brightness.light
      ? const Color.fromRGBO(51, 51, 51, 1)
      : Colors.white;

  Color get secondaryTextColor => MediaQuery.of(this).platformBrightness == Brightness.light
      ? const Color.fromRGBO(130, 130, 130, 1)
      : Colors.white;

  Color get activeTextColor => MediaQuery.of(this).platformBrightness == Brightness.light
      ? const Color.fromRGBO(47, 128, 237, 1)
      : Colors.white;

  TextStyle get h1 => GoogleFonts.jost(
        color: textColor,
        fontWeight: FontWeight.w600,
        fontSize: 32,
      );

  TextStyle get h2 => GoogleFonts.jost(
        color: textColor,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      );

  TextStyle get h3 => GoogleFonts.jost(
        color: secondaryTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );

  TextStyle m1({bool active = false}) => GoogleFonts.jost(
        color: active ? activeTextColor : textColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
}
