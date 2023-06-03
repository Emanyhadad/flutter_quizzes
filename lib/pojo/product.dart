class Product {
  int? id;
  int? categoryId;
  int? subcategoryId;
  String? productNameEn;
  String? productNameAr;
  String? brandEn;
  String? brandAr;
  String? productQty;
  String? productSize;
  String? basePrice;
  String? sellingPrice;
  String? discountPrice;
  String? descriptionEn;
  String? descriptionAr;
  String? productThumbnail;
  int? trend;
  int? newProduct;
  int? offer;
  String? createdAt;
  String? updatedAt;
  List<String>? colors;
  List<String>? multiImg;

  Product(
      {this.id,
        this.categoryId,
        this.subcategoryId,
        this.productNameEn,
        this.productNameAr,
        this.brandEn,
        this.brandAr,
        this.productQty,
        this.productSize,
        this.basePrice,
        this.sellingPrice,
        this.discountPrice,
        this.descriptionEn,
        this.descriptionAr,
        this.productThumbnail,
        this.trend,
        this.newProduct,
        this.offer,
        this.createdAt,
        this.updatedAt,
        this.colors,
        this.multiImg});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    productNameEn = json['product_name_en'];
    productNameAr = json['product_name_ar'];
    brandEn = json['brand_en'];
    brandAr = json['brand_ar'];
    productQty = json['product_qty'];
    productSize = json['product_size'];
    basePrice = json['base_price'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    productThumbnail = json['product_thumbnail'];
    trend = json['trend'];
    newProduct = json['new_product'];
    offer = json['offer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['colors'] != null) {
      colors = [];
      json['colors'].forEach((v) {
        colors!.add(v);
      });
    }
    if (json['multi_img'] != null) {
      multiImg = [];
      json['multi_img'].forEach((v) {
        multiImg!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['product_name_en'] = this.productNameEn;
    data['product_name_ar'] = this.productNameAr;
    data['brand_en'] = this.brandEn;
    data['brand_ar'] = this.brandAr;
    data['product_qty'] = this.productQty;
    data['product_size'] = this.productSize;
    data['base_price'] = this.basePrice;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    data['description_en'] = this.descriptionEn;
    data['description_ar'] = this.descriptionAr;
    data['product_thumbnail'] = this.productThumbnail;
    data['trend'] = this.trend;
    data['new_product'] = this.newProduct;
    data['offer'] = this.offer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v).toList();
    }
    if (this.multiImg != null) {
      data['multi_img'] = this.multiImg!.map((v) => v).toList();
    }
    return data;
  }
}
