
import 'package:medicine_app/utils/icon_path.dart';

enum BottomBarOptions {
  home,
  category,
  account,
  wishlist,
  bag,
}

extension BottomBarOptionsExtension on BottomBarOptions {
  String get name {
    switch (this) {
      case BottomBarOptions.home:
        return 'Home';
      case BottomBarOptions.category:
        return 'Categories';
      case BottomBarOptions.account:
        return 'Account';
      case BottomBarOptions.wishlist:
        return 'Wishlist';
      case BottomBarOptions.bag:
        return 'Bag';
    }
  }

  String get iconPath {
    switch (this) {
      case BottomBarOptions.home:
        return IconPath.homeIcon;
      case BottomBarOptions.category:
        return IconPath.categoryIcon;
      case BottomBarOptions.account:  
        return IconPath.accountIcon;
      case BottomBarOptions.wishlist:
        return IconPath.wishlistIcon;
      case BottomBarOptions.bag:
        return IconPath.bagIcon;
    }
  }

  String get selectedIconPath {
    switch (this) {
      case BottomBarOptions.home:
        return IconPath.homeIconSolid;
      case BottomBarOptions.category:
        return IconPath.categoryIconSolid;
      case BottomBarOptions.account:
        return IconPath.accountIconSolid;
      case BottomBarOptions.wishlist:
        return IconPath.wishlistIconSolid;
      case BottomBarOptions.bag:
        return IconPath.bagIconSolid;
    }
  }

}
