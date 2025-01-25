import 'dart:convert';

import 'package:medicine_app/core/errors/exceptions.dart';
import 'package:medicine_app/home/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:medicine_app/utils/urls.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductsModel>> getAllProducts();

  Future<List<ProductsModel>> getFavouriteProducts({required String userId});

  Future<List<ProductsModel>> getNewProducts();

  Future<List<ProductsModel>> getRecentlyViewedProducts(
      {required String userId});

  Future<List<ProductsModel>> getTrendyProducts();

  // Future<List<BannersModel>> getAllBanners();

  // Future<List<ProductsModel>> getBannerProducts({required Banners banner});
}

class HomeRemoteDataSourceImplementation implements HomeRemoteDataSource {
  const HomeRemoteDataSourceImplementation(this._client);

  final http.Client _client;

  @override
  Future<List<ProductsModel>> getAllProducts() async {
    try {
      final response = await _client.get(
        Uri.https(
          Urls.baseURL,
          Urls.getAllProducts,
        ),
      );
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      final data = jsonDecode(response.body);
      // print(data);
      final productList = (data['products'] as List)
          .map((product) => ProductsModel.fromMap(product))
          .toList();
      // print(productList);

      return productList;
    } on APIException {
      rethrow;
    } catch (e) {
      print("PRODUCT ERROR: " + e.toString());
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<ProductsModel>> getFavouriteProducts(
      {required String userId}) async {
    try {
      final response = await _client.get(
        Uri.https(Urls.baseURL, Urls.getFavouriteProducts, {"userId": userId}),
      );
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      final data = jsonDecode(response.body);
      // print(data);
      final productList = (data['products'] as List)
          .map((product) => ProductsModel.fromMap(product))
          .toList();
      // print(productList);

      return productList;
    } on APIException {
      rethrow;
    } catch (e) {
      // print(e.toString());
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<ProductsModel>> getNewProducts() async {
    try {
      final response = await _client.get(
        Uri.https(
          Urls.baseURL,
          Urls.getNewProducts,
        ),
      );
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      final data = jsonDecode(response.body);
      // print(data);
      final productList = (data['products'] as List)
          .map((product) => ProductsModel.fromMap(product))
          .toList();
      // print(productList);

      return productList;
    } on APIException {
      rethrow;
    } catch (e) {
      // print(e.toString());
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<ProductsModel>> getRecentlyViewedProducts(
      {required String userId}) async {
    try {
      final response = await _client.get(
        Uri.https(
            Urls.baseURL, Urls.getRecentlyViewedProducts, {"userId": userId}),
      );
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      final data = jsonDecode(response.body);
      // print(data);
      final productList = (data['products'] as List)
          .map((product) => ProductsModel.fromMap(product))
          .toList();
      // print(productList);

      return productList;
    } on APIException {
      rethrow;
    } catch (e) {
      // print(e.toString());
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<ProductsModel>> getTrendyProducts() async {
    try {
      final response = await _client.get(
        Uri.https(
          Urls.baseURL,
          Urls.getTrendyProducts,
        ),
      );
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      final data = jsonDecode(response.body);
      // print(data['products'][0].runtimeType);
      final productList = (data['products'] as List)
          .map((product) => ProductsModel.fromMap(product))
          .toList();
      // print(productList);

      return productList;
    } on APIException {
      rethrow;
    } catch (e) {
      // print(e.toString());
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  // @override
  // Future<List<BannersModel>> getAllBanners() async {
  //   try {
  //     final response = await _client.get(
  //       Uri.https(
  //         Urls.baseURL,
  //         Urls.getAllBanners,
  //       ),
  //     );
  //     print("GET ALL BANNERS");
  //     if (response.statusCode != 200) {
  //       throw APIException(
  //           message: response.body, statusCode: response.statusCode);
  //     }
  //     final data = jsonDecode(response.body);
  //     // print(data['banners'][0].runtimeType);
  //     final bannerList = (data['banners'] as List)
  //         .map((banner) => BannersModel.fromMap(banner))
  //         .toList();
  //     // print(bannerList);
  //     return bannerList;
  //   } on APIException {
  //     rethrow;
  //   } catch (e) {
  //     print("BANNER ERROR: " + e.toString());
  //     throw APIException(message: e.toString(), statusCode: 505);
  //   }
  // }

  // @override
  // Future<List<ProductsModel>> getBannerProducts(
  //     {required Banners banner}) async {
  //   try {
  //     // BannersModel newBannerModel= banner as BannersModel;
  //     // newBannerModel=newBannerModel.copyWith(collectionTitle: "");
  //     // print(banner);

  //     String encodedParams = Uri.encodeComponent(jsonEncode(banner));
  //     final response = await _client.get(
  //       Uri.https(
  //         Urls.baseURL,
  //         Urls.getBannerProducts,
  //         // {"banner": jsonEncode(newBannerModel)}
  //         {"banner": encodedParams}
  //       ),
  //     );
  //     // print(response.statusCode);
  //     // print(response.body);
  //     if (response.statusCode != 200) {
  //       print(response.body);
  //       print(response.statusCode);
  //       throw APIException(
  //           message: response.body, statusCode: response.statusCode);
  //     }
  //     final data = jsonDecode(response.body);
  //     final productList = (data['products'] as List)
  //         .map((product) => ProductsModel.fromMap(product))
  //         .toList();
  //     print(productList);

  //     return productList;
  //   } on APIException {
  //     print("BANNER PRODUCT ERROR: ");
  //     rethrow;
  //   } catch (e) {
  //     print("BANNER PRODUCT ERROR: " + e.toString());
  //     throw APIException(message: e.toString(), statusCode: 505);
  //   }
  // }

}
