// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:medicine_app/utils/styles.dart';
// import 'package:medicine_app/widgets/custom_shimmer.dart';

// class BagScreen extends StatefulWidget{
//   const BagScreen({super.key});

//   @override
//   State<BagScreen> createState() => _BagScreenState();
// }

// class _BagScreenState extends State<BagScreen> {
//   List<CartItems>? _cartItems;
//   List<CartItems> _selectedCartItems = [];
//   List<CartItems> _unselectedCartItems = [];
//   Addresses? _cartAddress;
//   List<CartCoupons>? _appliedCoupons;
//   CartPrice? _cartPrice;

//   @override
//   void initState() {
//     super.initState();
//     // context.read<GetBagItemsCubit>().getBagItems();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         // context.read<GetBagItemsCubit>().dispose();
//         return false;
//       },
//       child: Scaffold(
//         backgroundColor: context.appTheme.secondaryBgColor,
//         body: BlocConsumer<GetBagItemsCubit, GetBagItemsState>(
//           listener: (context, state) {
//             if (state is GetBagItemsLoaded) {
//               // print("LOADED: ${state.cart} ${state.cart.addressInfo}");
//               context.read<ApplyCouponsCubit>().dispose();
//               _cartItems = state.cart.products;
//               _selectedCartItems = [];
//               _unselectedCartItems = [];
//               _cartAddress = state.cart.addressInfo;
//               _appliedCoupons = state.cart.appliedCoupons;
//               _cartPrice = state.cart.prices;
//               _cartItems?.forEach((cartItem) {
//                 if (!cartItem.saveForLater) {
//                   _selectedCartItems.add(cartItem);
//                 } else {
//                   _unselectedCartItems.add(cartItem);
//                 }
//               });
//             } else if (state is GetBagItemsError) {
//               // print("GET BAGITEMS ERROR ${state.errorCode} ${state.message}");
//             } else if (state is UpdatedBagItemLoaded) {
//               // print("UPDATE LOADED: ${state.cart.addressInfo?.streetAddress}");
//               _cartItems = null;
//               _cartItems = [...state.cart.products];
//               _selectedCartItems = [];
//               _unselectedCartItems = [];
//               _cartAddress = state.cart.addressInfo;
//               _cartPrice = state.cart.prices;
//               _cartItems?.forEach((cartItem) {
//                 if (!cartItem.saveForLater) {
//                   _selectedCartItems.add(cartItem);
//                 } else {
//                   _unselectedCartItems.add(cartItem);
//                 }
//               });
//               // print(_selectedCartItems);
//               setState(() {});
//               // print(_selectedCartItems[0].quantityAdded);
//             } else {
//               _cartItems = null;
//             }
//           },
//           builder: (context, state) {
//             return Stack(
//               children: [
//                 CustomScrollView(
//                   slivers: [
//                     const BagAppBar(),
//                     CartAddressWidget(cartAddress: _cartAddress),
//                     const SliverToBoxAdapter(
//                       child: SizedBox(
//                         height: 10,
//                       ),
//                     ),
//                     SliverVisibility(
//                       visible: _cartItems != null,
//                       sliver: SliverToBoxAdapter(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 8, horizontal: 16),
//                           child: Text(
//                             "${_selectedCartItems.length} ITEM${_selectedCartItems.length > 1 ? "S" : ""} SELECTED",
//                             style: Styles.semiBoldStyleXXS.copyWith(
//                                 color: context.appTheme.darkBgColor
//                                     .withOpacity(0.8)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SliverVisibility(
//                       visible: _cartItems != null,
//                       sliver: BagProducts(
//                         cartItems: _selectedCartItems,
//                       ),
//                     ),
//                     SliverVisibility(
//                       visible: _cartItems == null,
//                       sliver: const BagProducts(),
//                     ),
//                     const SliverToBoxAdapter(
//                       child: SizedBox(
//                         height: 10,
//                       ),
//                     ),
//                     SliverVisibility(
//                       visible:
//                           _cartItems != null && _unselectedCartItems.isNotEmpty,
//                       sliver: SliverToBoxAdapter(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 8, horizontal: 16),
//                           child: Text(
//                             "${_unselectedCartItems.length} ITEM${_unselectedCartItems.length > 1 ? "S" : ""} UNSELECTED",
//                             style: Styles.semiBoldStyleXXS.copyWith(
//                                 color: context.appTheme.darkBgColor
//                                     .withOpacity(0.8)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SliverVisibility(
//                       visible:
//                           _cartItems != null && _unselectedCartItems.isNotEmpty,
//                       sliver: BagProducts(
//                         cartItems: _unselectedCartItems,
//                       ),
//                     ),
//                     const SliverToBoxAdapter(
//                       child: BagCoupon(),
//                     ),
//                     const SliverToBoxAdapter(
//                       child: SizedBox(
//                         height: 15,
//                       ),
//                     ),
//                     const SliverToBoxAdapter(
//                       child: BagPriceDetails(),
//                     ),
//                     const SliverToBoxAdapter(
//                       child: SizedBox(
//                         height: 100,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Visibility(
//                     visible: _selectedCartItems.isNotEmpty,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 8),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0, -1),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               _cartPrice != null
//                                   ? Text(
//                                       "₹${_cartPrice?.total}",
//                                       overflow: TextOverflow.ellipsis,
//                                       style: Styles.boldStyleS.copyWith(
//                                         color:
//                                             context.appTheme.textBrightBgColor,
//                                       ),
//                                     )
//                                   : CustomShimmer(
//                                       height: 1.sw / 4,
//                                       width: 1.sw / 6,
//                                     ),
//                               _cartPrice != null
//                                   ? Text(
//                                       "View Details",
//                                       overflow: TextOverflow.ellipsis,
//                                       style: Styles.semiBoldStyleXXXS.copyWith(
//                                         color: context.appTheme.secondaryColor,
//                                       ),
//                                     )
//                                   : CustomShimmer(
//                                       height: 1.sw / 4,
//                                       width: 1.sw / 6,
//                                     ),
//                             ],
//                           ),
//                           const SizedBox(
//                             width: 30,
//                           ),
//                           Expanded(
//                               child: CustomElevatedButton(
//                             onPressed:
//                                 _selectedCartItems.isNotEmpty ? () {} : null,
//                             title: "Order Now",
//                           )),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: state is RemovingBagItem,
//                   child: Positioned.fill(
//                       child: Container(
//                     color: Colors.black.withOpacity(0.3),
//                     child: Center(
//                       child: CircularProgressIndicator(
//                           color: context.appTheme.secondaryColor),
//                     ),
//                   )),
//                 ),
//               ],
//             );
//           },
//           // );
//           // },
//         ),
//       ),
//     );
//   }
// }
