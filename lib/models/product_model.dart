// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// class ProductModel {
//   List<Products>? products;

//   ProductModel({this.products});

//   ProductModel.fromJson(Map<String, dynamic> json) {
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Products {
//   int? id;
//   String? title;
//   String? description;
//   String? category;
//   double? price;
//   double? discountPercentage;
//   double? rating;
//   int? stock;
//   List<String>? tags;
//   String? brand;
//   String? sku;
//   int? weight;
//   Dimensions? dimensions;
//   String? warrantyInformation;
//   String? shippingInformation;
//   String? availabilityStatus;
//   List<Reviews>? reviews;
//   String? returnPolicy;
//   int? minimumOrderQuantity;
//   Meta? meta;
//   List<String>? images;
//   String? thumbnail;

//   Products(
//       {this.id,
//       this.title,
//       this.description,
//       this.category,
//       this.price,
//       this.discountPercentage,
//       this.rating,
//       this.stock,
//       this.tags,
//       this.brand,
//       this.sku,
//       this.weight,
//       this.dimensions,
//       this.warrantyInformation,
//       this.shippingInformation,
//       this.availabilityStatus,
//       this.reviews,
//       this.returnPolicy,
//       this.minimumOrderQuantity,
//       this.meta,
//       this.images,
//       this.thumbnail});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     category = json['category'];
//     price = json['price'];
//     discountPercentage = json['discountPercentage'];
//     rating = json['rating'];
//     stock = json['stock'];
//     tags = json['tags'].cast<String>();
//     brand = json['brand'];
//     sku = json['sku'];
//     weight = json['weight'];
//     dimensions = json['dimensions'] != null
//         ? new Dimensions.fromJson(json['dimensions'])
//         : null;
//     warrantyInformation = json['warrantyInformation'];
//     shippingInformation = json['shippingInformation'];
//     availabilityStatus = json['availabilityStatus'];
//     if (json['reviews'] != null) {
//       reviews = <Reviews>[];
//       json['reviews'].forEach((v) {
//         reviews!.add(new Reviews.fromJson(v));
//       });
//     }
//     returnPolicy = json['returnPolicy'];
//     minimumOrderQuantity = json['minimumOrderQuantity'];
//     meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
//     images = json['images'].cast<String>();
//     thumbnail = json['thumbnail'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['category'] = this.category;
//     data['price'] = this.price;
//     data['discountPercentage'] = this.discountPercentage;
//     data['rating'] = this.rating;
//     data['stock'] = this.stock;
//     data['tags'] = this.tags;
//     data['brand'] = this.brand;
//     data['sku'] = this.sku;
//     data['weight'] = this.weight;
//     if (this.dimensions != null) {
//       data['dimensions'] = this.dimensions!.toJson();
//     }
//     data['warrantyInformation'] = this.warrantyInformation;
//     data['shippingInformation'] = this.shippingInformation;
//     data['availabilityStatus'] = this.availabilityStatus;
//     if (this.reviews != null) {
//       data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
//     }
//     data['returnPolicy'] = this.returnPolicy;
//     data['minimumOrderQuantity'] = this.minimumOrderQuantity;
//     if (this.meta != null) {
//       data['meta'] = this.meta!.toJson();
//     }
//     data['images'] = this.images;
//     data['thumbnail'] = this.thumbnail;
//     return data;
//   }
// }

// class Dimensions {
//   double? width;
//   double? height;
//   double? depth;

//   Dimensions({this.width, this.height, this.depth});

//   Dimensions.fromJson(Map<String, dynamic> json) {
//     width = json['width'];
//     height = json['height'];
//     depth = json['depth'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['width'] = this.width;
//     data['height'] = this.height;
//     data['depth'] = this.depth;
//     return data;
//   }
// }

// class Reviews {
//   int? rating;
//   String? comment;
//   String? date;
//   String? reviewerName;
//   String? reviewerEmail;

//   Reviews(
//       {this.rating,
//       this.comment,
//       this.date,
//       this.reviewerName,
//       this.reviewerEmail});

//   Reviews.fromJson(Map<String, dynamic> json) {
//     rating = json['rating'];
//     comment = json['comment'];
//     date = json['date'];
//     reviewerName = json['reviewerName'];
//     reviewerEmail = json['reviewerEmail'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['rating'] = this.rating;
//     data['comment'] = this.comment;
//     data['date'] = this.date;
//     data['reviewerName'] = this.reviewerName;
//     data['reviewerEmail'] = this.reviewerEmail;
//     return data;
//   }
// }

// class Meta {
//   String? createdAt;
//   String? updatedAt;
//   String? barcode;
//   String? qrCode;

//   Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

//   Meta.fromJson(Map<String, dynamic> json) {
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     barcode = json['barcode'];
//     qrCode = json['qrCode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['barcode'] = this.barcode;
//     data['qrCode'] = this.qrCode;
//     return data;
//   }
// }

class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String>? images;
  final String? thumbnail;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'],
      dimensions: Dimensions.fromJson(json['dimensions']),
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e))
          .toList(),
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: Meta.fromJson(json['meta']),
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'],
    );
  }
}

class Dimensions {
  final double? width;
  final double? height;
  final double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
      depth: json['depth'].toDouble(),
    );
  }
}

class Review {
  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      date: DateTime.parse(json['date']),
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}

class Meta {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }
}
