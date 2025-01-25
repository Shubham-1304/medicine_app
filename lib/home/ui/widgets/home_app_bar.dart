import 'package:flutter/material.dart';
import 'package:medicine_app/home/widgets/search_bar.dart';
import 'package:medicine_app/utils/extensions.dart';
import 'package:medicine_app/utils/styles.dart';
import 'package:medicine_app/widgets/gradient_text.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GradientText(
                        "SNC",
                        gradient: LinearGradient(colors: [
                          context.appTheme.primaryColor,
                          context.appTheme.secondaryColor
                        ]),
                        style: Styles.boldStyleXXXL,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  // onTap: () => context.push(NotificationScreen()),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8),
                        child: SizedBox(
                          height: 22,
                          width: 22,
                          child: Image.asset(
                              'assets/images/icons/ic_bold_notification.png'),
                        ),
                      ),
                      true
                          ? Positioned(
                              right: 4,
                              top: 4,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 14,
                                  minHeight: 14,
                                ),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
              // onTap: () => context.push(const SearchScreen()),
              child: const SearchBarWidget()),
        ],
      ),
    );
  }
}