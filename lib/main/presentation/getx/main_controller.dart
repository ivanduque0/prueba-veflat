import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:prueba_veflat/main/domain/entities/cart_item.dart';
import 'package:prueba_veflat/utils/constants.dart';

import '../../domain/entities/character.dart';
import '../../domain/repositories/api_main_repository.dart';
import '../../domain/repositories/local_main_repository.dart';

class MainController extends GetxController {
  final LocalMainInterface localMainInterface;
  final ApiMainInterface apiMainInterface;

  MainController({required this.localMainInterface, required this.apiMainInterface});

  RxList characters = [].obs;
  RxList episodes = [].obs;
  Rx<Character> character = Character.empty().obs;
  RxList cart = [].obs;
  RxInt genderIndex = 0.obs;
  RxInt subTotal = 0.obs;
  RxString genderString = "".obs;
  RxInt currentCharactersPage = 1.obs;
  RxBool noMoreCharacters = false.obs;
  RxList favoriteProducts = [].obs;  
  RxBool showProducts = true.obs;
  RxBool retrievengProducts = false.obs;
  Rx<CartItem> cartItem = CartItem.empty().obs;
  RxBool descriptionExpanded = false.obs;

  final scrollController = ScrollController();
  @override
  void onReady() {
    super.onReady();
    setCharacters();


  }

  refreshProducts(){
    showProducts(false);
    showProducts(true);
  }

  setGenderString(){
    genderString(Constants.genders[genderIndex.value]);
  }

  setCharacters({bool? other_gendertrue=false}) async {
    if (other_gendertrue==true) {
      setGenderString();
      currentCharactersPage(1);
      noMoreCharacters(false);
      List episodesFromAPI = await apiMainInterface.retrieveAllCharacters(gender: genderString.value, page: 1);
      characters.assignAll(episodesFromAPI.map((data) => Character.fromJson(data)).toList());
    } else {
      List episodesFromAPI = await apiMainInterface.retrieveAllCharacters(gender: genderString.value, page: currentCharactersPage.value++);
      characters.addAll(episodesFromAPI.map((data) => Character.fromJson(data)).toList());
      if (episodesFromAPI.isEmpty) {
        noMoreCharacters(true);
      }
    }
  }

  isfavoriteProduct(index){
    return favoriteProducts.contains(index);
  }

  addRemoveFromFavorites(id){
    if (!favoriteProducts.contains(id)) {
      favoriteProducts.add(id);
    } else {
      favoriteProducts.remove(id);
    }
  }

  updateCartItem(CartItem item){
    cartItem(item);
  }

  deleteItemFromCart(int index){
    final priceToDecrease = cart[index].price*cart[index].quantity;
    decreaseSubTotal(priceToDecrease);
    cart.removeAt(index);
  }

  decreaseSubTotal(int price){
    subTotal-=price;
  }

  increaseItemQuantity(int index){  
    if (cart[index].quantity>998) return;
    cart[index] = cart[index].copyWith(
      quantity: cart[index].quantity+1
    );
    increaseSubTotal(cart[index].price);
  }

  decreaseItemQuantity(int index){
    if (cart[index].quantity<2) return;
    cart[index] = cart[index].copyWith(
      quantity: cart[index].quantity-1
    );
    decreaseSubTotal(cart[index].price);
  }

  

  increaseSubTotal(int price){
    subTotal+=price;
  }

  calculateSubTotal(){
    subTotal(0);
    for (CartItem item in cart) {
      subTotal+=(item.quantity! * item.price!);
    }
  }

  addItemToCart(CartItem itemToAdd){

    for (var i = 0; i < cart.length; i++) {
      final item = cart[i];
      if (item.character.id==itemToAdd.character!.id && item.size==itemToAdd.size && item.color["name"]==itemToAdd.color!["name"]) {
        increaseItemQuantity(i);
        return;
      }
    }
    cart.add(itemToAdd);

  }

}
