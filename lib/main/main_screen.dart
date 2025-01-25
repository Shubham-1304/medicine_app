import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicine_app/home/home_screen.dart';
import '../utils/bottom_bar_option.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.inititalTab}) : super(key: key);
  static const String routeName = '/mainScreen';

  final BottomBarOptions? inititalTab;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late BottomBarOptions _selectedPage;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _changePage(BottomBarOptions option) {
    if (_selectedPage != option) {
      setState(() => _selectedPage = option);
    }
  }

  Widget get currentScreen {
    switch (_selectedPage) {
      case BottomBarOptions.home:
        return (const HomeScreen());
      // case BottomBarOptions.category:
      //   return const CategoriesScreen();
      // case BottomBarOptions.account:
      //   return AccountScreen();
      // case BottomBarOptions.wishlist:
      //   return const WishlistScreen();
      // case BottomBarOptions.bag:
      //   // context.push(const BagScreen()).then((value) => _changePage(BottomBarOptions.home));
      //   return const BagScreen();
      default:
        return (const HomeScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    // PrefUtils.setIsFirstLaunch(false);
    _selectedPage = widget.inititalTab ?? BottomBarOptions.home;
  }

  @override
  void deactivate() {
    print("mainscreen deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("mainscreen dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return const HomeScreen();
    // print("ACCOUNT DETAILS: ${accountPrefs.get("user").firstName}");
    return WillPopScope(
      onWillPop: () async {
        if (_selectedPage == BottomBarOptions.home) {
          await SystemNavigator.pop();
          return false;
        }
        setState(() {
          _selectedPage = BottomBarOptions.home;
        });
        //  await context.pushReplacement(HomeScreen());
        return false;
      },
      child: HomeScreenCallback(
        changePage: _changePage,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFF0F4F7),
            body: HomeScreenCallback(
              changePage: _changePage,
              child: currentScreen,
            ),
            // bottomNavigationBar: HomeBottomBarWidget(currentPage: _selectedPage),
            key: _scaffoldKey,
          ),
        ),
      ),
    );
  }
}

class HomeScreenCallback extends InheritedWidget {
  final Function(BottomBarOptions) changePage;

  const HomeScreenCallback({
    Key? key,
    required Widget child,
    required this.changePage,
  }) : super(key: key, child: child);

  static HomeScreenCallback of(BuildContext context) {
    final HomeScreenCallback? result =
        context.dependOnInheritedWidgetOfExactType<HomeScreenCallback>();
    assert(result != null, 'No HomeScreenCallback found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(oldWidget) => false;
}
