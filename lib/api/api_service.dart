import 'dart:convert';
import 'package:bookstore/Models/genre.dart';
import 'package:bookstore/Models/product.dart';
import 'package:bookstore/Models/product_filter.dart';
import 'package:bookstore/widgets/config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final apiService = Provider((ref) => APIService());

class APIService {
  static var client = http.Client();

  Future<List<Genre>?> getGenres(page, pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString()
    };

    var url = Uri.http(Config.apiURL, Config.genreAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return genresFromJson(data("data"));
    } else {
      return null;
    }
  }

  Future<List<Product>?> getProducts(
      ProductFilterModel productFilterModel) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Map<String, String> queryString = {
      'page': productFilterModel.paginationModel.page.toString(),
      'pageSize': productFilterModel.paginationModel.pageSize.toString()
    };
    if (productFilterModel.GenreId != null) {
      queryString["GenreId"] = productFilterModel.GenreId!;
    }

    var url = Uri.http(Config.apiURL, Config.genreAPI, queryString);

    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return productsFromJson(data("data"));
    } else {
      return null;
    }
  }
}
