class Product{
  final String productId;
  final String name;
   final String dept;

  Product({this.productId,this.dept, this.name});

  Map<String,dynamic> toMap(){
    return {
      'productId' : productId,
      'name' : name,
      'dept' : dept,
    };
  }

  Product.fromFirestore(Map<String, dynamic> firestore)
      : productId = firestore['productId'],
        name = firestore['name'],
        dept = firestore['dept'];
}