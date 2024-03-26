// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:from_zero_to_hero_ht/features/products/domain/product.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/product_detail_page.dart';

class ProdutoCard extends StatelessWidget {
  final Product product;

  const ProdutoCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      elevation: 5.0,
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Row(
        children: [
          //SizedBox(width: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                product.thumbnail,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              //padding: const EdgeInsets.only(left: 8, top: 10,),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Marca: ${product.brand}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Avaliação: ${product.rating}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Row(
                        children: List.generate(
                          product.rating.floor(),
                          (index) => const Icon(
                            Icons.star_sharp,
                            color: Colors.orange,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (product.discountPercentage > 15)
                    Row(
                      children: [
                        Text(
                          "Desconto: ${product.discountPercentage}%",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                          size: 25,
                        ),
                        SizedBox(
                          width: 65,
                        ),
                        SizedBox(
                          height: 25,
                          width: 50,
                          child: Align(
                            alignment: Alignment.center,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetail(product: product),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                //shape: CircleBorder(),
                                padding: EdgeInsets.zero,
                              ),
                              child: Icon(
                                Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (product.discountPercentage < 15)
                    Row(
                      children: [
                        Text(
                          "Desconto: ${product.discountPercentage}%",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Icon(
                          Icons.ac_unit,
                          color: Colors.lightBlueAccent,
                          size: 25,
                        ),
                        SizedBox(
                          width: 65,
                        ),
                        SizedBox(
                          height: 25,
                          width: 50,
                          child: Align(
                            alignment: Alignment.center,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetail(product: product),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                //shape: CircleBorder(),
                                padding: EdgeInsets.zero,
                              ),
                              child: Icon(
                                Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
