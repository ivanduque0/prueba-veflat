import 'package:prueba_veflat/main/domain/entities/character.dart';

class CartItem {
  Character? character;
  Map? color;
  String? size;
  int? price;
  int? quantity;

  CartItem(
      {this.character,
      this.color,
      this.size,
      this.quantity,
      this.price});

  CartItem.fromJson(Map<String, dynamic> json) {
    character = json['character'] != null ? new Character.fromJson(json['character']) : null;
    color = json['color'];
    size = json['size'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (character != null) {
      data['character'] = character!.toJson();
    }
    data['color'] = color;
    data['size'] = size;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }

  factory CartItem.empty() => CartItem(
      character:null,
      size: null,
      color: {},
      price: 0,
      quantity: 0,
    );

  CartItem copyWith({
    Character? character,
    String? size,
    Map? color,
    int? price,
    int? quantity
  }) {
    return CartItem(
    character: character ?? this.character,
    size: size?? this.size,
    color: color?? this.color,
    price: price?? this.price,
    quantity: quantity?? this.quantity
   
    );
  }
}
