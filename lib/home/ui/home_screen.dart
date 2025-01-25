import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_app/home/ui/widgets/home_app_bar.dart';
import 'package:medicine_app/utils/bottom_bar_option.dart';
import 'package:medicine_app/utils/extensions.dart';
import 'package:medicine_app/utils/styles.dart';
import 'package:medicine_app/widgets/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isBottomNavigationVisible = true;
  bool _isScrollingDown = false;
  bool _isScrollingUp = false;
  double currentPos = 0.0;
  double currentOffset = 0.0;
  // double scrollDownOffset = 0.0;
  double scrollUpOffset = 0.0;

  void _scrollListener() {
    bool isScrolledDown = _scrollController.position.userScrollDirection ==
        ScrollDirection.reverse;
    if (_scrollController.offset < 65) {
      setState(() {
        _isBottomNavigationVisible = true;
      });
    } else {
      // Change the visibility of the BottomNavigationBar based on scroll direction
      setState(() {
        _isBottomNavigationVisible = !isScrolledDown;
      });
    }

    bool isScrolledUp = _scrollController.position.userScrollDirection ==
        ScrollDirection.forward;
    // print(scrollController.offset);
    // Change the visibility of the BottomNavigationBar based on scroll direction
    setState(() {
      _isScrollingDown = isScrolledDown;
      _isScrollingUp = isScrolledUp;
      if (_isScrollingDown) {
        // print("scrolling down: ${currentPos} ${_scrollController.offset}");
        // print("currentPos: $currentPos");
        // print("_scrollController.offset: ${_scrollController.offset}");

        if (currentPos > -150) {
          // print(_isScrollingDown);
          currentPos = -1 * (_scrollController.offset - scrollUpOffset);
          currentOffset = _scrollController.offset;
        }
        // scrollDownOffset=_scrollController.offset;
      } else if (_isScrollingUp) {
        // print("scrolling up");
        // print(scrollController.offset);
        if (currentPos < -150) {
          // print("setting to -150");
          currentPos = -150;
          currentOffset = _scrollController.offset;
        } else if (currentPos >= -150 && currentPos < 0) {
          // print("pre: $currentPos");
          currentPos = currentPos + (currentOffset - _scrollController.offset);
          // print("post: $currentPos");
          currentOffset = _scrollController.offset;
        } else {
          // print("pinned");
          currentPos = 0;
        }
        scrollUpOffset = _scrollController.offset;
      }
      // print("Pos: $currentPos");
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    // context.read<NewProductsCubit>().getNewProducts();
    // context.read<HomeCubit>().getAllProducts();
    // context.read<BannerCubit>().getAllBanners();
    fetchAndDisplayData();
    print("homescreen initstate");
    // print("latest build: ${RemoteConfigUtils.latestAppVersion}");
    // remoteConfig.onConfigUpdated.listen((event) async {
    //   print("TRIGGERED");
    //   await remoteConfig.fetchAndActivate();
    //   print(event.updatedKeys.toList());
    // });
  }

  Future<void> fetchAndDisplayData() async {
    final List<Future<void>> fetchers = [
      // context.read<NewProductsCubit>().getNewProducts(),
      // context.read<BannerCubit>().getAllBanners(),
      // context.read<RecentlyViewedProductCubit>().getRecentlyViewedProducts(userId: "sncU1"),
      // context.read<FavoriteProductsCubit>().getFavoriteProducts(userId: "sncU1"),
      // context.read<TrendyProductsCubit>().getTrendyProducts(),
      // context.read<AllProductsCubit>().getAllProducts(),
    ];
    await Future.wait(fetchers);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("homescreen didChangeDependencies");
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    print("homescreen didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("homescreen deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("homescreen dispose");
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  Future<bool> popScreen() async {
    // Navigator.of(context).pop();
    // dispose();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => fetchAndDisplayData(),
      color: context.appTheme.secondaryColor,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () => popScreen(),
          child: Scaffold(
            // drawer: Drawer(
            //   width: 1.sw,
            //   shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //         topRight: Radius.zero, bottomRight: Radius.zero),
            //   ),
            //   child: const HomeDrawer(),
            // ),
            body: Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 150,
                      ),
                    ),
                    // const SliverAppBar(
                    //   flexibleSpace: AppBarWidget(),
                    //   collapsedHeight: 150,
                    //   pinned: true,
                    // ),
                    // AnimatedContainer(duration: Duration(seconds: 3),child: AppBarWidget()),
                    // const SliverToBoxAdapter(child: HomeScreenBanners()),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 10,
                    )),
                    // const SliverToBoxAdapter(
                    //   child: HomeNewProducts(),
                    // ),
                    // const SliverToBoxAdapter(
                    //   child: HomeRecentlyViewedProducts(),
                    // ),
                    // const SliverToBoxAdapter(
                    //   child: HomeFavoriteProducts(),
                    // ),
                    // const SliverToBoxAdapter(
                    //   child: HomeTrendyProducts(),
                    // ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "All Products",
                          style: Styles.boldStyleXL.copyWith(
                              color: Colors.black.withOpacity(0.7),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                    // const ProductGridView(isLoaded: false),
                  ],
                ),
                Positioned(
                    top: currentPos,
                    child: SizedBox(
                        height: 150, width: 1.sw, child: const AppBarWidget())),
              ],
            ),
            bottomNavigationBar: AnimatedContainer(
              height: _isBottomNavigationVisible ? 65 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutSine,
              child: const SingleChildScrollView(
                child: HomeBottomBarWidget(currentPage: BottomBarOptions.home),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// SliverToBoxAdapter(
                  //   child: Text(
                  //     "New Products",
                  //     style: Styles.boldStyleXL
                  //         .copyWith(color: Colors.black.withOpacity(0.7)),
                  //   ),
                  // ),
                  // const SliverToBoxAdapter(
                  //     child: SizedBox(
                  //   height: 10,
                  // )),
                  // const ProductGridView(homeProducts: HomeProductsEnum.newProducts),
                  // FlexibleSpaceBar(collapseMode: ,)