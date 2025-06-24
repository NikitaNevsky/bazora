import "package:bazora/features/api/supabase/database/database.dart";
import "package:bazora/features/api/supabase/database/tables/product_price_stock_view.dart";
import "package:bazora/features/catalog/model/banners_response.dart";
import "package:bazora/features/catalog/model/category_response.dart";
import "package:bazora/features/catalog/model/city_response.dart";
import "package:bazora/features/catalog/model/product_with_images_response.dart";
import "package:bazora/features/catalog/presentation/catalogpage.dart";
import "package:bazora/main.dart";
import "package:bazora/router/app_routes.dart";
import "package:flutter/cupertino.dart";

mixin HomeMixin on State<CatalogPage> {

  late Future<List<ProductPriceStockViewRow>> futureProducts;
  List<ProductWithImagesResponse> products = [];
  List<BannersResponse> banners = [];
  List<CategoryResponse> categories = [];
  List<CityResponse> cityResponse = [];

  @override
  void initState() {
    super.initState();
    getCities();
    getBanners();
    getCategories();
    futureProducts = fetchProducts();
  }

  // Method 1: Basic fetch all data
  Future<void> getProductWithImages() async {
    try {
      final response = await supabase.from('product_with_images').select();
      setState(() {
        final product = (response as List).map((json) => ProductWithImagesResponse.fromJson(json)).toList();
        print("Method 1 _ ${product[1].name}");
        products = product;
      });
    } catch (error) {
      print("Error: $error");
    }
  }

  // Method 2: Basic fetch Banners
  Future<void> getBanners() async {
    try {
      final response = await supabase.from('banners').select();
      setState(() {
        final banner = (response as List).map((json) => BannersResponse.fromJson(json)).toList();
        print("Method 2 _ ${banner.length}");
        banners = banner;
      });
    } catch (error) {
      print("Error: $error");
    }
  }

  // Method 3: Basic fetch Categories
  Future<void> getCategories() async {
    try {
      final response = await supabase.from('categories').select();
      setState(() {
        final category = (response as List).map((json) => CategoryResponse.fromJson(json)).toList();
        print("Method 2 _ ${category.length}");
        categories = category;
      });
    } catch (error) {
      print("Error: $error");
    }
  }

  // Method 4: Basic fetch Cities
  Future<void> getCities() async {
    try {
      final response = await supabase.from('cities').select();
      setState(() {
        final cityRes = (response as List).map((json) => CityResponse.fromJson(json)).toList();
        print("Method 4 _ ${cityRes.length}");
        cityResponse = cityRes;
      });
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<List<ProductPriceStockViewRow>> fetchProducts() async {
    return ProductPriceStockViewTable().queryRows(
      queryFn: (q) => q
          .eqOrNull('product_is_archive', false)
          .eqOrNull('product_is_delete', false)
          .eqOrNull('point_city', localSource.cityID),
      limit: 100,
    );
  }

  void updateCityId() {
    setState(() {
      // cityIDni yangilash va ma'lumotlarni qayta yuklash
      futureProducts = fetchProducts();
    });
  }

  Future updateFavoritesList(
      String userID,
      String productID,
      bool isFavorite,
      ) async {
    // Add your function code here!
    // Получаем экземпляр клиента Supabase
    final SupabaseClient _supabaseClient = SupaFlow.client;

    try {
      // Проверяем, существует ли запись с указанным userID и productID
      final response = await _supabaseClient
          .from('favorite_products')
          .select('id')
          .eq('user_id', userID)
          .eq('product_id', productID)
          .maybeSingle(); // Возвращает null, если запись не найдена
      print(response);
      if (response != null) {
        // Если запись существует, обновляем поле is_favorite
        final updateResponse = await _supabaseClient
            .from('favorite_products')
            .update({'is_favorite': isFavorite}).eq('id', response['id']);

        print('Статус избранного успешно обновлён.');
      } else {
        // Если запись не существует, добавляем новую
        final Map<String, dynamic> record = {
          'product_id': productID,
          'user_id': userID,
          'is_favorite': isFavorite,
        };

        final insertResponse = await _supabaseClient.from('favorite_products').insert(record);

        print('Товар успешно добавлен в избранное.');
      }
    } catch (e) {
      // Логируем исключение при ошибке выполнения запроса
      print('Произошла ошибка при обновлении списка избранного:  $e ');
    }
  }


}
