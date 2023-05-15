class MenuItem{
  final String price;
  final String name;
  final String volume;

  MenuItem(this.price, this.name, this.volume);

  Map<String, dynamic> toJson(){
      return {
        "price": price,
        "name": name,
        "volume": volume
      };
  }

  static MenuItem fromJson(Map<String, dynamic> json){
    return MenuItem(
      json['price'], json['name'], json['volume']);
  }
}