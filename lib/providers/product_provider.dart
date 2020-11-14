import 'package:authentic/models/product.dart';
import 'package:authentic/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _name;
  String _dept;
  String _productId;
  var uuid = Uuid();

  //Getters
  String get name => _name;
  String get dept => _dept;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeDept(String value) {
    _dept = value;
    notifyListeners();
  }
  loadValues(Product product){
    _name=product.name;
    _dept=product.dept;
    _productId=product.productId;
  }


  saveProduct() {
    print(_productId);
    if (_productId == null) {
      var newProduct = Product(name: name, dept: dept, productId: uuid.v4());
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct =
          Product(name: name, dept: _dept, productId: _productId);
      firestoreService.saveProduct(updatedProduct);
    }
  }

  removeProduct(String productId){
    firestoreService.removeProduct(productId);
  }

}
