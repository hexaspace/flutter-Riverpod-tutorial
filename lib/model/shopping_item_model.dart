class ShoppingItemModel {
  //이름
  final String name;
  // 개수
  final int quantity;
  // 구매여부
  final bool hasBought;
  // 매운지
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });
  ShoppingItemModel copyWith({
    // 옵셔널로 값을 받는다.
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name, // ?? : null이면 this.name
      quantity: quantity ?? this.quantity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}
