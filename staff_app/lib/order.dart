class Order{
  final String customer;
  final List<Map<String, dynamic>> order;

  Order(this.customer, this.order);

  static Order fromJson(Map<String, dynamic> json){
      return Order(json['customer'], (json['order'] as List).cast<Map<String, dynamic>>());
  }
}