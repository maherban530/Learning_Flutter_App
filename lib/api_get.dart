import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ProductExample extends StatefulWidget {
  const ProductExample({Key? key}) : super(key: key);

  @override
  State<ProductExample> createState() => _ProductExampleState();
}

class _ProductExampleState extends State<ProductExample> {
  var data;
  Future<ProductModelTest> getApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/07cf69cb-f1b9-43fe-aa3e-706166ffd3c7'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      print(data);

      return ProductModelTest.fromJson(data);
    } else {
      return ProductModelTest.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API Course -Product Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<ProductModelTest>(
                future: getApi(),
                builder: (context, AsyncSnapshot<ProductModelTest> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(snapshot.data!.data![index].name.toString()),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Text('Loading');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// success : true
/// message : "All Shops Data"
/// data : [{"name":"ONE","shopemail":"ONE@gmail.com","image":"https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-confident-1714666150","__v":0,"products":[{"title":"Denim Shirt Grey","price":"3,490 ","images":[{"_id":"61963b4300622d794418687f","filename":"images[0]-1637235522052-730096647.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"},{"_id":"61963c2e00622d7944187316","filename":"images[0]-1637235757437-927339951.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"},{"_id":"61963c2e00622d7944187317","filename":"images[1]-1637235758276-122593199.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"}],"__v":1,"in_wishlist":false},{"title":"Printed Hoodie Grey","price":"3,590 ","images":[{"_id":"6197493700622d794418cded","filename":"images[0]-1637304627221-448731879.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"},{"_id":"6197493700622d794418cdee","filename":"images[1]-1637304628418-102234457.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"},{"_id":"6197493700622d794418cdef","filename":"images[2]-1637304629564-380376274.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"}],"__v":0,"in_wishlist":false}]}]

class ProductModelTest {
  ProductModelTest({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  ProductModelTest.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Data>? _data;
  ProductModelTest copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      ProductModelTest(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
      );
  bool? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "ONE"
/// shopemail : "ONE@gmail.com"
/// image : "https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-confident-1714666150"
/// __v : 0
/// products : [{"title":"Denim Shirt Grey","price":"3,490 ","images":[{"_id":"61963b4300622d794418687f","filename":"images[0]-1637235522052-730096647.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"},{"_id":"61963c2e00622d7944187316","filename":"images[0]-1637235757437-927339951.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"},{"_id":"61963c2e00622d7944187317","filename":"images[1]-1637235758276-122593199.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"}],"__v":1,"in_wishlist":false},{"title":"Printed Hoodie Grey","price":"3,590 ","images":[{"_id":"6197493700622d794418cded","filename":"images[0]-1637304627221-448731879.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"},{"_id":"6197493700622d794418cdee","filename":"images[1]-1637304628418-102234457.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"},{"_id":"6197493700622d794418cdef","filename":"images[2]-1637304629564-380376274.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"}],"__v":0,"in_wishlist":false}]

class Data {
  Data({
    String? name,
    String? shopemail,
    String? image,
    int? v,
    List<Products>? products,
  }) {
    _name = name;
    _shopemail = shopemail;
    _image = image ?? "";
    _v = v;
    _products = products;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _shopemail = json['shopemail'];
    _image = json['image'];
    _v = json['__v'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  String? _name;
  String? _shopemail;
  String? _image;
  int? _v;
  List<Products>? _products;
  Data copyWith({
    String? name,
    String? shopemail,
    String? image,
    int? v,
    List<Products>? products,
  }) =>
      Data(
        name: name ?? _name,
        shopemail: shopemail ?? _shopemail,
        image: image ?? _image,
        v: v ?? _v,
        products: products ?? _products,
      );
  String? get name => _name;
  String? get shopemail => _shopemail;
  String? get image => _image;
  int? get v => _v;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['shopemail'] = _shopemail;
    map['image'] = _image;
    map['__v'] = _v;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// title : "Denim Shirt Grey"
/// price : "3,490 "
/// images : [{"_id":"61963b4300622d794418687f","filename":"images[0]-1637235522052-730096647.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"},{"_id":"61963c2e00622d7944187316","filename":"images[0]-1637235757437-927339951.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"},{"_id":"61963c2e00622d7944187317","filename":"images[1]-1637235758276-122593199.jpeg","url":"https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"}]
/// __v : 1
/// in_wishlist : false

class Products {
  Products({
    String? title,
    String? price,
    List<Images>? images,
    int? v,
    bool? inWishlist,
  }) {
    _title = title;
    _price = price;
    _images = images;
    _v = v;
    _inWishlist = inWishlist;
  }

  Products.fromJson(dynamic json) {
    _title = json['title'];
    _price = json['price'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _v = json['__v'];
    _inWishlist = json['in_wishlist'];
  }
  String? _title;
  String? _price;
  List<Images>? _images;
  int? _v;
  bool? _inWishlist;
  Products copyWith({
    String? title,
    String? price,
    List<Images>? images,
    int? v,
    bool? inWishlist,
  }) =>
      Products(
        title: title ?? _title,
        price: price ?? _price,
        images: images ?? _images,
        v: v ?? _v,
        inWishlist: inWishlist ?? _inWishlist,
      );
  String? get title => _title;
  String? get price => _price;
  List<Images>? get images => _images;
  int? get v => _v;
  bool? get inWishlist => _inWishlist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['price'] = _price;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['__v'] = _v;
    map['in_wishlist'] = _inWishlist;
    return map;
  }
}

/// _id : "61963b4300622d794418687f"
/// filename : "images[0]-1637235522052-730096647.jpeg"
/// url : "https://www.shutterstock.com/image-photo/30092019-riga-latvia-sports-girl-prepares-1616559388"

class Images {
  Images({
    String? id,
    String? filename,
    String? url,
  }) {
    _id = id;
    _filename = filename;
    _url = url;
  }

  Images.fromJson(dynamic json) {
    _id = json['_id'];
    _filename = json['filename'];
    _url = json['url'];
  }
  String? _id;
  String? _filename;
  String? _url;
  Images copyWith({
    String? id,
    String? filename,
    String? url,
  }) =>
      Images(
        id: id ?? _id,
        filename: filename ?? _filename,
        url: url ?? _url,
      );
  String? get id => _id;
  String? get filename => _filename;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['filename'] = _filename;
    map['url'] = _url;
    return map;
  }
}
