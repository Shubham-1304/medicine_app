import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_app/utils/styles.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, -1),
                ),
              ],
              border: Border.all(color: Colors.grey, width: 1),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.done
                          ? AnimatedTextKit(
                            totalRepeatCount: 1,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Search by name, brand, & more...',
                                  textStyle: Styles.regularStyleXXS
                                      .copyWith(color: Colors.grey),
                                  cursor: '|',
                                  speed: const Duration(milliseconds: 120),
                                ),
                              ],
                            )
                          : const SizedBox();
                    }),
                // Text(
                //   "Search name, brand, & more...",
                //   style: Styles.regularStyleXXS.copyWith(color: Colors.grey),
                // )
              ],
            ),
          ),
        ),
        GestureDetector(
          // onTap: () => context.push(const SearchScreen()),
          child: Container(
            height: 50,
            width: 1.sw,
            margin: EdgeInsets.symmetric(horizontal: 5),
            color: Colors.transparent,
          ),
        )
      ],
    );
  }
}
