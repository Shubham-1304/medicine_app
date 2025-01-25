// import 'package:get_it/get_it.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   // App Logic
//   sl.registerFactory(() => AuthenticationCubit(
//         createUser: sl(),
//         getUserByEmail: sl(),
//         getUserByMobile: sl(),
//       ));

//   sl.registerFactory(() => HomeCubit(
//         getAllProducts: sl(),
//         getFavouriteProducts: sl(),
//         getNewProducts: sl(),
//         getRecentlyViewedProducts: sl(),
//         getTrendyProducts: sl(),
//       ));

//   sl.registerFactory(() => BannerCubit(getAllBanners: sl()));

//   sl.registerFactory(() => NewProductsCubit(getNewProducts: sl()));

//   sl.registerFactory(() => RecentlyViewedProductCubit(getRecentlyViewedProducts: sl()));

//   sl.registerFactory(() => FavoriteProductsCubit(getFavouriteProducts: sl()));

//   sl.registerFactory(() => TrendyProductsCubit(getTrendyProducts: sl()));

//   sl.registerFactory(() => AllProductsCubit(getAllProducts: sl()));

//   sl.registerFactory(() => AccountCubit(updateUserDetails: sl()));

//   sl.registerFactory(() => SimilarProductsCubit(getSimilarProducts: sl()));

//   sl.registerFactory(() => GroupProductsCubit(getGroupProducts: sl()));

//   sl.registerFactory(() => AddToCartCubit(addToCart: sl()));

//   sl.registerFactory(() => GetBannerProductsCubit(getBannerProducts: sl()));

//   sl.registerFactory(() => AllCategoriesCubit(getAllCAtegories: sl()));

//   sl.registerFactory(() => GetProductsByCategoryCubit(getProductsByCategory: sl()));

//   sl.registerFactory(() => MostSearchedCategoriesCubit(mostSearchedCategories: sl()));

//   sl.registerFactory(() => SearchAutoSuggestionCubit(GetSearchAutoSuggestion: sl()));

//   sl.registerFactory(() => GetProductCubit(getProduct: sl()));

//   sl.registerFactory(() => GetCategoryFiltersCubit(getCategoryFilters: sl()));

//   sl.registerFactory(() => GetFilterOptionsCubit(getFilterOptions: sl()));

//   sl.registerFactory(() => GetBagItemsCubit(getBagItems: sl(),removeBagItem: sl(),updateBagItem: sl(),applyCoupon: sl()));

//   // sl.registerFactory(() => UpdateBagItemCubit(updateBagItem: sl()));

//   sl.registerFactory(() => ApplyCouponsCubit(applyCoupon: sl()));

//   sl.registerFactory(() => GetAddressCubit(getAddress: sl()));

//   // Use Cases
//   sl.registerLazySingleton(() => CreateUser(sl()));
//   sl.registerLazySingleton(() => GetUserByEmail(sl()));
//   sl.registerLazySingleton(() => GetUserByMobile(sl()));

//   sl.registerLazySingleton(() => GetAllProducts(sl()));
//   sl.registerLazySingleton(() => GetFavouriteProducts(sl()));
//   sl.registerLazySingleton(() => GetNewProducts(sl()));
//   sl.registerLazySingleton(() => GetRecentlyViewedProducts(sl()));
//   sl.registerLazySingleton(() => GetTrendyProducts(sl()));
//   sl.registerLazySingleton(() => GetAllBanners(sl()));
//   sl.registerLazySingleton(() => GetBannerProducts(sl()));
//   sl.registerLazySingleton(() => GetProductsByCategory(sl()));

//   sl.registerLazySingleton(() => UpdateUserDetails(sl()));

//   sl.registerLazySingleton(() => GetSimilarProducts(sl()));
//   sl.registerLazySingleton(() => GetGroupProducts(sl()));
//   sl.registerLazySingleton(() => AddToCart(sl()));
//   sl.registerLazySingleton(() => GetProduct(sl()));

//   sl.registerLazySingleton(() => GetCategories(sl()));
//   sl.registerLazySingleton(() => MostSearchedCategories(sl()));
//   sl.registerLazySingleton(() => GetSearchAutoSuggestion(sl()));

//   sl.registerLazySingleton(() => GetCategoryFilters(sl()));
//   sl.registerLazySingleton(() => GetFilterOptions(sl()));

//   sl.registerLazySingleton(() => GetBagItems(sl()));
//   sl.registerLazySingleton(() => RemoveBagItem(sl()));
//   sl.registerLazySingleton(() => UpdateBagItem(sl()));
//   sl.registerLazySingleton(() => ApplyCoupon(sl()));

//   sl.registerLazySingleton(() => GetAddress(sl()));

//   // Repositories
//   sl.registerLazySingleton<AuthenticationRepository>(
//       () => AuthenticationRepositoryImplementation(sl()));

//   sl.registerLazySingleton<HomeRepository>(
//       () => HomeRepositoriesImplementation(sl()));

//   sl.registerLazySingleton<AccountRepository>(() => AccountRepositoryImplementation(sl()));

//   sl.registerLazySingleton<ProductRepository>(() => ProductRepositoriesImplementation(sl()));

//   sl.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImplementation(sl()));

//   sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImplementation(sl()));

//   sl.registerLazySingleton<BagRepository>(() => BagRepositoryImplementation(sl()));

//   sl.registerLazySingleton<AddressRepository>(() => AddressRepositoryImplementation(sl()));

//   // Data Source
//   sl.registerLazySingleton<AuthenticationRemoteDataSource>(
//       () => AuthenticationRemoteDataSourceImplementation(sl()));

//   sl.registerLazySingleton<HomeRemoteDataSource>(
//       () => HomeRemoteDataSourceImplementation(sl()));

//   sl.registerLazySingleton<AccountRemoteDataSource>(() => AccountRemoteDataSourceImplementation(sl()));

//   sl.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImplementation(sl()));

//   sl.registerLazySingleton<CategoryRemoteDataSource>(() => CategoryRemoteDataSourceImplementation(sl()));

//   sl.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImplementation(sl()));

//   sl.registerLazySingleton<BagRemoteDataSource>(() => BagRemoteDataSourceImplementation(sl()));

//   sl.registerLazySingleton<AddressRemoteDataSource>(() => AddressRemoteDataSourceImplementation(sl()));

//   // External Dependencies
//   sl.registerLazySingleton(http.Client.new);
// }
