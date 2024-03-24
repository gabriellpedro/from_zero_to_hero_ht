import 'package:flutter/material.dart';
import 'package:from_zero_to_hero_ht/features/products/domain/product.dart';

class ProdutoCard extends StatelessWidget {
  final Product product;

  const ProdutoCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(5),
      color: Colors.white,
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
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Marca: ${product.brand}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
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
                      )
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
                        SizedBox(width: 10.0),
                        Icon(
                          Icons.ac_unit,
                          color: Colors.lightBlueAccent,
                          size: 25,
                        )
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
