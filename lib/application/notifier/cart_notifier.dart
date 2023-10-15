import 'package:book_store/Models/cart_product.dart';
import 'package:book_store/api/api_service.dart';
import 'package:book_store/application/state/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<CartState> {
  final APIService _apiService;

  CartNotifier(this._apiService) : super(const CartState()) {
    getCartItems();
  }

  Future<void> getCartItems() async {
    state = state.copyWith(isLoading: true);

    final cartData = await _apiService.getCart();

    state = state.copyWith(cartModel: cartData);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addCartItems(productId, qty) async {
    state = state.copyWith(isLoading: true);

    await _apiService.addCartItem(productId, qty);

    await getCartItems();
  }

  Future<void> removeCartItems(productId, qty) async {
    await _apiService.addCartItem(productId, qty);
    var isCartItemExist = state.cartModel!.products
        .firstWhere((element) => element.product.productId == productId);

    var updatedItems = state.cartModel!;

    updatedItems.products.remove(isCartItemExist);

    state = state.copyWith(cartModel: updatedItems);
  }

  Future<void> updateQty(productId, qty, type) async {
    var cartItem = state.cartModel!.products
        .firstWhere((element) => element.product.productId == productId);

    var updatedItems = state.cartModel!;

    if (type == "-") {
      await _apiService.removeCartItem(productId, 1);

      if (cartItem.qty > 1) {
        CartProduct cartProduct =
            CartProduct(qty: cartItem.qty - 1, product: cartItem.product);

        updatedItems.products.remove(cartItem);
        updatedItems.products.add(cartProduct);
      } else {
        updatedItems.products.remove(cartItem);
      }
    } else {
      await _apiService.addCartItem(productId, 1);

      CartProduct cartProduct =
          CartProduct(qty: cartItem.qty + 1, product: cartItem.product);

      updatedItems.products.remove(cartItem);
      updatedItems.products.add(cartProduct);
    }

    state = state.copyWith(cartModel: updatedItems);
  }
}
