import 'package:flutter/material.dart';
import 'package:medicine_app/main/main_screen.dart';
import 'package:medicine_app/utils/bottom_bar_option.dart';
import 'package:medicine_app/utils/extensions.dart';
import 'package:medicine_app/utils/styles.dart';

class HomeBottomBarWidget extends StatelessWidget {
  const HomeBottomBarWidget({
    Key? key,
    required this.currentPage,
  }) : super(key: key);
  final BottomBarOptions currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: List.generate(
          BottomBarOptions.values.length,
          (index) => BottomBarOptionWidget(
            item: BottomBarOptions.values.elementAt(index),
            // onTap: (){},
            onTap: HomeScreenCallback.of(context).changePage,
            isSelected: currentPage == BottomBarOptions.values.elementAt(index),
          ),
        ),
      ),
    );
  }
}

class BottomBarOptionWidget extends StatelessWidget {
  const BottomBarOptionWidget({
    Key? key,
    required this.item,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final BottomBarOptions item;
  final Function onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(item),
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width / 5,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                  child: Image.asset(
                    '${isSelected ? item.selectedIconPath : item.iconPath}.png',
                    gaplessPlayback: true,
                  ),
                ),
              ),
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: isSelected? Styles.semiBoldStyleXXXS.copyWith(color: Colors.black):Styles.regularStyleXXXS.copyWith(color: Colors.black),
              ),
              isSelected?Container(
                height: 5,
                decoration: BoxDecoration(
                  color: context.appTheme.secondaryColor,
                  borderRadius: BorderRadius.circular(20)
                ),
              ): const SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
