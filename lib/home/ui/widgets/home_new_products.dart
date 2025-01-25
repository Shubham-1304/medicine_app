import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_app/home/ui/cubit/new_products_cubit.dart';

// import 'package:sunidhi_creation_new/widgets/custom_elevated_button.dart';
// import 'package:sunidhi_creation_new/widgets/product_catalogue_shimmer.dart';

class HomeNewProducts extends StatefulWidget {
  const HomeNewProducts({super.key});

  @override
  State<HomeNewProducts> createState() => _HomeNewProductsState();
}

class _HomeNewProductsState extends State<HomeNewProducts> {
  late NewProductsCubit bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NewProductsCubit>(context);
  }

  @override
  void dispose() {
    print("NEW PRODUCTS DISPOSED");
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewProductsCubit, NewProductsState>(
      listener: (context, state) {
        if (state is NewProductsLoaded) {
          print("NEW PRODUCT LOADED");
        } else if (state is NewProductsError) {
          print(state.message + state.errorCode.toString());
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Visibility(
                visible: state is NewProductsLoaded,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Products",
                        style: Styles.boldStyleXL.copyWith(
                            color: Colors.black.withOpacity(0.7),
                            overflow: TextOverflow.ellipsis),
                      ),
                      GestureDetector(
                        onTap: () {
                          // bloc.dispose();
                          // context.push(
                          //   const CategoryScreen(
                          //     categoryName: "New Products",
                          //   ),
                          // )
                          // .then(
                          //   (value) => context
                          //       .read<NewProductsCubit>()
                          //       .getNewProducts(),
                          // );
                        },
                        child: GradientText(
                          "View All",
                          gradient: LinearGradient(colors: [
                            context.appTheme.primaryColor,
                            context.appTheme.secondaryColor
                          ]),
                          style: Styles.semiBoldStyleS,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Stack(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state is NewProductsLoaded
                          ? state.products.length
                          : 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 15,
                              crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        late Products currentProduct;
                        String? productName;
                        String? description;
                        num? costPrice;
                        num? salesPrice;
                        List<String>? productColors;
                        // num? discount;
                        if (state is NewProductsLoaded) {
                          currentProduct = state.products[index];
                          productName = currentProduct.productName;
                          costPrice = currentProduct.productCostPrice;
                          salesPrice = currentProduct.productSalesPrice;
                          // discount = currentProduct.productCostPrice;
                          description = currentProduct.productDescription;
                          productColors = currentProduct.productColors?.split(" ");
                        }
                        return state is NewProductsLoaded
                            ? GestureDetector(
                                // onTap: () => context.push(ProductScreen(
                                //   product: currentProduct,
                                // )),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: CardContainer(
                                    shadowColors: productColors,
                                    borderWidth: 3,
                                    borderRadius: 8,
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            state is NewProductsLoaded
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              state
                                                                  .products[
                                                                      index]
                                                                  .catalogueImage!,
                                                            ),
                                                            fit: BoxFit.fill)),
                                                    height: 1.sw / 1.8,
                                                  )
                                                : CustomShimmer(
                                                    height: 1.sw / 1.8,
                                                    borderRadius: 5,
                                                  ),
                                            Positioned(
                                              bottom: 5,
                                              right: 5,
                                              child: GestureDetector(
                                                // onTap: () => setState(() {
                                                //   _isFav = !_isFav;
                                                // }),
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 8),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      // true?
                                                      const Icon(
                                                        Icons.favorite_sharp,
                                                        color: Colors.red,
                                                      ),
                                                      // : const Icon(
                                                      //     Icons.favorite_border_sharp,
                                                      //     color: Colors.grey,
                                                      //   ),
                                                      Text(
                                                        "100k",
                                                        style: Styles
                                                            .semiBoldStyleXXXS
                                                            .copyWith(
                                                                color: Colors
                                                                    .grey),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          productName ?? "Saree",
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.semiBoldStyleXXS
                                              .copyWith(
                                                  color: Colors.black
                                                      .withOpacity(0.6)),
                                        ),
                                        Text(
                                          description ?? "Short description",
                                          maxLines: 2,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.regularStyleXXS,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              salesPrice != null
                                                  ? salesPrice.toString()
                                                  : "",
                                              style: Styles.boldStyleXXXS,
                                            ),
                                            Text(
                                              costPrice != null
                                                  ? costPrice.toString()
                                                  : "",
                                              style: Styles.regularStyleXXXS
                                                  .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              salesPrice != null
                                                  ? salesPrice.toString()
                                                  : "",
                                              style: Styles.boldStyleXXXS,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const ProductCatalogueShimmer();
                      }),
                  Visibility(
                    visible: state is NewProductsLoaded,
                    child: Positioned(
                      bottom: 10,
                      child: ViewAllButton(
                        onTap: () {
                          bloc.dispose();
                          // if()
                          // context.push(
                          //   const CategoryScreen(
                          //     categoryName: "New Products",
                          //   ),
                          // )
                          // .then(
                          //   (value) => context
                          //       .read<NewProductsCubit>()
                          //       .getNewProducts(),
                          // );
                        },
                        height: 80,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
