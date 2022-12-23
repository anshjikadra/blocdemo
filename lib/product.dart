/*
{id: 1,
title: iPhone 9,
description: An apple mobile which is nothing like apple,
price: 549,
discountPercentage: 12.96,
rating: 4.69,
stock: 94,
brand: Apple,
category: smartphones,
thumbnail: https://i.dummyjson.com/data/products/1/thumbnail.jpg,
images: [https://i.dummyjson.com/data/products/1/1.jpg, https://i.dummyjson.com/data/products/1/2.jpg, https://i.dummyjson.com/data/products/1/3.jpg, https://i.dummyjson.com/data/products/1/4.jpg, https://i.dummyjson.com/data/products/1/thumbnail.jpg]}
 */
class product
{
  int id,price,stock;
  String title,description,brand,category,thumbnail;
  double discountPercentage,rating;
  List images=[];

  product(
      this.id,
      this.price,
      this.stock,
      this.title,
      this.description,
      this.brand,
      this.category,
      this.thumbnail,
      this.discountPercentage,
      this.rating,
      this.images);


  static product fromJson(Map m)
  {
    return product(m['id'], m['price'], m['stock'], m['title'], m['description'], m['brand'],
        m['category'], m['thumbnail'], m['discountPercentage'], m['rating'], m['images']);
  }
}

