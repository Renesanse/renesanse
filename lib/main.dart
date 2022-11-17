import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

const borderRadius = Radius.circular(8);
const imageSize = 100.0;
const defaultPadding = 18.0;

void main() {
  runApp(
    MediaQuery.fromWindow(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            Builder(builder: (context) {
              return ColoredBox(
                color: context.backGroundColor,
                child: CustomScrollView(
                  clipBehavior: Clip.none,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(borderRadius),
                            color: context.accentColor,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: borderRadius,
                                      topRight: borderRadius,
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 200,
                                      child: AnimateGradient(
                                        duration: const Duration(seconds: 1),
                                        primaryBegin: Alignment.topLeft,
                                        primaryEnd: Alignment.bottomLeft,
                                        secondaryBegin: Alignment.bottomLeft,
                                        secondaryEnd: Alignment.topRight,
                                        primaryColors: [
                                          Colors.deepPurpleAccent,
                                          Colors.deepPurple,
                                          Colors.lightBlue,
                                          Colors.blueAccent,
                                        ],
                                        secondaryColors: [
                                          Colors.blueAccent,
                                          Colors.lightBlue,
                                          Colors.deepPurple,
                                          Colors.deepPurpleAccent,
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: imageSize / 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(defaultPadding),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Daniel (🇺🇦) Surnin",
                                          style: TextStyle(fontSize: 30, color: context.textColor),
                                        ),
                                        const SizedBox(height: 2),
                                        Text("Mobile applications enjoyer",
                                            style:
                                                TextStyle(fontSize: 15, color: context.textColor)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                top: imageSize * 1.5,
                                left: defaultPadding,
                                child: SizedBox.square(
                                  dimension: imageSize,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: context.accentColor,
                                        width: 3,
                                        strokeAlign: StrokeAlign.outside,
                                      ),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/avatar.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    ),
  );
}

extension LightDetector on BuildContext {
  Color get backGroundColor => MediaQuery.of(this).platformBrightness == Brightness.light
      ? const Color.fromRGBO(230, 230, 230, 1)
      : const Color.fromRGBO(30, 30, 30, 1);

  Color get accentColor => MediaQuery.of(this).platformBrightness == Brightness.light
      ? const Color.fromRGBO(246, 246, 246, 1)
      : const Color.fromRGBO(40, 40, 40, 1);

  Color get textColor =>
      MediaQuery.of(this).platformBrightness == Brightness.light ? Colors.black : Colors.white;
}
