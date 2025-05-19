import 'package:flutter_riverpod/flutter_riverpod.dart';

// Use StateNotifierProvider for better state management
final hasShopProvider =
    StateNotifierProvider<HasShopNotifier, bool>((ref) => HasShopNotifier());

class HasShopNotifier extends StateNotifier<bool> {
  HasShopNotifier() : super(false);

  void setHasShop(bool value) {
    state = value;
  }
}

// New provider for shop state
final shopStateProvider = StateProvider<bool>((ref) => false);
