// To parse this JSON data, do
//
//     final checkbo = checkboFromJson(jsonString);

import 'dart:convert';

Checkbo checkboFromJson(String str) => Checkbo.fromJson(json.decode(str));

String checkboToJson(Checkbo data) => json.encode(data.toJson());

class Checkbo{
  Checkbo({
    this.data,
    this.st,
  });

  List<Datum> data;
  String st;

  factory Checkbo.fromJson(Map<String, dynamic> json) => Checkbo(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    st: json["st"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "st": st,
  };
}

class Datum{
  Datum({
    this.clProductId,
    this.accId,
    this.clProductBrandId,
    this.clProductCatId,
    this.clProductSubCatId,
    this.clProductSupplierId,
    this.clProductName,
    this.clProductShortname,
    this.clProductSortDesc,
    this.clProductDesc,
    this.clProductUnitPrice,
    this.clProductSalePrice,
    this.clProductPckSize,
    this.clProductWeight,
    this.clProductHeight,
    this.clProductHsnCode,
    this.clProductSkuCode,
    this.clProductAsin,
    this.clProductIsbn,
    this.clProductImg,
    this.clProductImgUrl,
    this.clProductRadioBtn,
    this.pattributes,
    this.pvariation,
    this.clProductGrpColor,
    this.clProductColorCode,
    this.clProductStatus,
    this.clProductBarcode,
    this.clProductCreatedBy,
    this.clProductUpdatedBy,
    this.clProductCreatedDate,
    this.clProductUpdatedDate,
    this.isDeleted,
    this.hsnCode,
    this.hsnIgst,
    this.hsnCgst,
    this.hsnSgst,
    this.clCategoryName,
    this.clSubcategoryName,
    this.colors,
    this.value,

  });

  String clProductId;
  String accId;
  String clProductBrandId;
  String clProductCatId;
  String clProductSubCatId;
  String clProductSupplierId;
  String clProductName;
  String clProductShortname;
  String clProductSortDesc;
  ClProductDesc clProductDesc;
  String clProductUnitPrice;
  String clProductSalePrice;
  String clProductPckSize;
  String clProductWeight;
  String clProductHeight;
  String clProductHsnCode;
  String clProductSkuCode;
  ClProductAsin clProductAsin;
  String clProductIsbn;
  List<dynamic> clProductImg;
  String clProductImgUrl;
  ClProductRadioBtn clProductRadioBtn;
  List<Pattribute> pattributes;
  String pvariation;
  String clProductGrpColor;
  String clProductColorCode;
  String clProductStatus;
  String clProductBarcode;
  String clProductCreatedBy;
  String clProductUpdatedBy;
  DateTime clProductCreatedDate;
  DateTime clProductUpdatedDate;
  String isDeleted;
  String hsnCode;
  String hsnIgst;
  String hsnCgst;
  String hsnSgst;
  ClCategoryName clCategoryName;
  ClSubcategoryName clSubcategoryName;
  List<Color> colors;
  bool value=false;


  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    value: false,
    clProductId: json["cl_product_id"],
    accId: json["acc_id"],
    clProductBrandId: json["cl_product_brand_id"],
    clProductCatId: json["cl_product_cat_id"],
    clProductSubCatId: json["cl_product_sub_cat_id"],
    clProductSupplierId: json["cl_product_supplier_id"],
    clProductName: json["cl_product_name"],
    clProductShortname: json["cl_product_shortname"],
    clProductSortDesc: json["cl_product_sort_desc"],
    clProductDesc: clProductDescValues.map[json["cl_product_desc"]],
    clProductUnitPrice: json["cl_product_unit_price"],
    clProductSalePrice: json["cl_product_sale_price"],
    clProductPckSize: json["cl_product_pck_size"],
    clProductWeight: json["cl_product_weight"],
    clProductHeight: json["cl_product_height"],
    clProductHsnCode: json["cl_product_hsn_code"],
    clProductSkuCode: json["cl_product_sku_code"],
    clProductAsin: clProductAsinValues.map[json["cl_product_asin"]],
    clProductIsbn: json["cl_product_isbn"],
    clProductImg: List<dynamic>.from(json["cl_product_img"].map((x) => x)),
    clProductImgUrl: json["cl_product_img_url"],
    clProductRadioBtn: clProductRadioBtnValues.map[json["cl_product_radio_btn"]],
    pattributes: List<Pattribute>.from(json["pattributes"].map((x) => Pattribute.fromJson(x))),
    pvariation: json["pvariation"],
    clProductGrpColor: json["cl_product_grp_color"],
    clProductColorCode: json["cl_product_color_code"],
    clProductStatus: json["cl_product_status"],
    clProductBarcode: json["cl_product_barcode"],
    clProductCreatedBy: json["cl_product_created_by"],
    clProductUpdatedBy: json["cl_product_updated_by"],
    clProductCreatedDate: DateTime.parse(json["cl_product_created_date"]),
    clProductUpdatedDate: DateTime.parse(json["cl_product_updated_date"]),
    isDeleted: json["is_deleted"],
    hsnCode: json["hsn_code"],
    hsnIgst: json["hsn_igst"],
    hsnCgst: json["hsn_cgst"],
    hsnSgst: json["hsn_sgst"],
    clCategoryName: clCategoryNameValues.map[json["cl_category_name"]],
    clSubcategoryName: clSubcategoryNameValues.map[json["cl_subcategory_name"]],
    colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cl_product_id": clProductId,
    "acc_id": accId,
    "cl_product_brand_id": clProductBrandId,
    "cl_product_cat_id": clProductCatId,
    "cl_product_sub_cat_id": clProductSubCatId,
    "cl_product_supplier_id": clProductSupplierId,
    "cl_product_name": clProductName,
    "cl_product_shortname": clProductShortname,
    "cl_product_sort_desc": clProductSortDesc,
    "cl_product_desc": clProductDescValues.reverse[clProductDesc],
    "cl_product_unit_price": clProductUnitPrice,
    "cl_product_sale_price": clProductSalePrice,
    "cl_product_pck_size": clProductPckSize,
    "cl_product_weight": clProductWeight,
    "cl_product_height": clProductHeight,
    "cl_product_hsn_code": clProductHsnCode,
    "cl_product_sku_code": clProductSkuCode,
    "cl_product_asin": clProductAsinValues.reverse[clProductAsin],
    "cl_product_isbn": clProductIsbn,
    "cl_product_img": List<dynamic>.from(clProductImg.map((x) => x)),
    "cl_product_img_url": clProductImgUrl,
    "cl_product_radio_btn": clProductRadioBtnValues.reverse[clProductRadioBtn],
    "pattributes": List<dynamic>.from(pattributes.map((x) => x.toJson())),
    "pvariation": pvariation,
    "cl_product_grp_color": clProductGrpColor,
    "cl_product_color_code": clProductColorCode,
    "cl_product_status": clProductStatus,
    "cl_product_barcode": clProductBarcode,
    "cl_product_created_by": clProductCreatedBy,
    "cl_product_updated_by": clProductUpdatedBy,
    "cl_product_created_date": clProductCreatedDate.toIso8601String(),
    "cl_product_updated_date": clProductUpdatedDate.toIso8601String(),
    "is_deleted": isDeleted,
    "hsn_code": hsnCode,
    "hsn_igst": hsnIgst,
    "hsn_cgst": hsnCgst,
    "hsn_sgst": hsnSgst,
    "cl_category_name": clCategoryNameValues.reverse[clCategoryName],
    "cl_subcategory_name": clSubcategoryNameValues.reverse[clSubcategoryName],
    "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
  };
}

enum ClCategoryName { MAKEUP }

final clCategoryNameValues = EnumValues({
  "Makeup": ClCategoryName.MAKEUP
});

enum ClProductAsin { SDGD }

final clProductAsinValues = EnumValues({
  "SDGD": ClProductAsin.SDGD
});

enum ClProductDesc { P_DSGDF_P }

final clProductDescValues = EnumValues({
  "<p>dsgdf</p>": ClProductDesc.P_DSGDF_P
});

enum ClProductRadioBtn { IMG }

final clProductRadioBtnValues = EnumValues({
  "img": ClProductRadioBtn.IMG
});

enum ClSubcategoryName { NAIL_PAINT }

final clSubcategoryNameValues = EnumValues({
  "Nail Paint": ClSubcategoryName.NAIL_PAINT
});

class Color {
  Color({
    this.clColorId,
    this.clColorCode,
    this.hexCode,
    this.skuCode,
  });

  String clColorId;
  String clColorCode;
  String hexCode;
  String skuCode;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    clColorId: json["cl_color_id"],
    clColorCode: json["cl_color_code"],
    hexCode: json["HexCode"],
    skuCode: json["sku_code"],
  );

  Map<String, dynamic> toJson() => {
    "cl_color_id": clColorId,
    "cl_color_code": clColorCode,
    "HexCode": hexCode,
    "sku_code": skuCode,
  };
}

class Pattribute {
  Pattribute({
    this.key,
    this.value,
  });

  Key key;
  Value value;

  factory Pattribute.fromJson(Map<String, dynamic> json) => Pattribute(
    key: keyValues.map[json["key"]],
    value: valueValues.map[json["value"]],
  );

  Map<String, dynamic> toJson() => {
    "key": keyValues.reverse[key],
    "value": valueValues.reverse[value],
  };
}

enum Key { VOLUME, AGE_RANGE, MODEL_NAME }

final keyValues = EnumValues({
  "Age Range": Key.AGE_RANGE,
  "Model Name": Key.MODEL_NAME,
  "Volume": Key.VOLUME
});

enum Value { THE_8_ML, ALL, COLORSOUL_RISE_NAIL_ENAMEL }

final valueValues = EnumValues({
  "All": Value.ALL,
  "Colorsoul Rise Nail Enamel": Value.COLORSOUL_RISE_NAIL_ENAMEL,
  "8 ML": Value.THE_8_ML
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
