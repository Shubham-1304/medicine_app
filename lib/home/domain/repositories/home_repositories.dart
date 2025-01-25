
import 'package:medicine_app/core/typedef.dart';
import 'package:medicine_app/home/domain/entities/products.dart';

abstract class HomeRepository{
  const HomeRepository();

    ResultFuture<List<Products>> getAllProducts();

    ResultFuture<List<Products>> getFavouriteProducts({
      required String userId
    });

    ResultFuture<List<Products>> getTrendyProducts();

    ResultFuture<List<Products>> getNewProducts();

    ResultFuture<List<Products>> getRecentlyViewedProducts({required String userId});

    // ResultFuture<List<Banners>> getAllBanners();

    // ResultFuture<List<Products>> getBannerProducts({required Banners banner});
}