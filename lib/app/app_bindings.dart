import 'package:food_yours_customer/auth/repository/auth_repository.dart';
import 'package:food_yours_customer/auth/repository/auth_repository_impl.dart';
import 'package:food_yours_customer/auth/service/auth_service.dart';
import 'package:food_yours_customer/cart/repository/cart_repository/cart_repository.dart';
import 'package:food_yours_customer/cart/repository/cart_repository/cart_repository_impl.dart';
import 'package:food_yours_customer/cart/service/cart_service/cart_service.dart';
import 'package:food_yours_customer/cart/service/food_yours_payment_service/food_yours_payment_service.dart';
import 'package:food_yours_customer/chef_screen/repository/chef_repository.dart';
import 'package:food_yours_customer/chef_screen/repository/chef_repository_impl.dart';
import 'package:food_yours_customer/chef_screen/service/chef_service.dart';
import 'package:food_yours_customer/common/repository/preference_repository/preference_repository.dart';
import 'package:food_yours_customer/common/repository/preference_repository/preference_repository_impl.dart';
import 'package:food_yours_customer/common/service/fcm_service.dart';
import 'package:food_yours_customer/home/repository/product_repository.dart';
import 'package:food_yours_customer/home/repository/product_repository_impl.dart';
import 'package:food_yours_customer/product_screen/service/product_service.dart';
import 'package:food_yours_customer/user/repository/user_repository.dart';
import 'package:food_yours_customer/user/repository/user_repository_impl.dart';
import 'package:food_yours_customer/user/service/user_service.dart';
import 'package:get/instance_manager.dart';

class AppBindings implements Bindings {
  @override
  dependencies() {
    Get.create<AuthRepository>(() => AuthRepositoryImpl());
    Get.create<AuthService>(() => AuthService());
    Get.create<UserService>(() => UserService());
    Get.create<UserRepository>(() => UserRepositoryImpl());
    Get.create<ProductService>(() => ProductService());
    Get.create<ChefService>(() => ChefService());
    Get.create<FoodYoursPaymentService>(() => FoodYoursPaymentService());
    Get.create<ChefRepository>(() => ChefRepositoryImpl());
    Get.create<ProductRepository>(() => ProductRepositoryImpl());
    Get.create<UserRepository>(() => UserRepositoryImpl());
    Get.create<CartRepository>(() => CartRepositoryImpl());
    Get.create<CartService>(() => CartService());
    Get.create<FCMService>(() => FCMService());
    Get.putAsync<PreferenceRepository>(() async {
      return await PreferenceRepositoryImpl.getInstance();
    });
    // Get.lazyPut<FoodYoursPaymentService>(() => FoodYoursPaymentService());
  }
}
