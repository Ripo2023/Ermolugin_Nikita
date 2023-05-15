class MenuItem{
  final String price;
  final String name;
  final String volume;

  MenuItem(this.price, this.name, this.volume);
//Реализация метода для длесериализации
  Map<String, dynamic> toJson(){
      return {
        "price": price,
        "name": name,
        "volume": volume
      };
  }
}