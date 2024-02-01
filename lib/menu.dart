import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  const MenuPage({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.home,
                              size: 30,
                            )),
                        const Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ],
                    ),
                    const Text(
                      'COMMON PROJECTS',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const Row(
                      children: [
                        Text(
                          '2',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.checkroom_sharp,
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.network(
                      widget.imageUrl,
                      height: 200,
                      width: 200,
                    ),

                    // const  Image(
                    //     image: NetworkImage(
                    //         'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1691697272-image.png?crop=1xw:1.00xh;center,top&resize=980:*'),
                    //     height: 300,
                    //     width: 400,
                    //   ),
                    // const   Image(
                    //     image: NetworkImage(
                    //         'https://crepdogcrew.com/cdn/shop/files/AirJordan1RetroHighOGSPNEXTCHAPTER_600x.png?v=1683613375'),
                    //     height: 300,
                    //     width: 400,
                    //   ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 180, top: 10, bottom: 20),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.circle_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.circle_outlined,
                        size: 15,
                      ),
                      Icon(
                        Icons.circle_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '\$',
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                    ),
                    Text(
                      widget.price.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 170,
                        height: 60,
                        decoration:
                            BoxDecoration(border: Border.all(width: 1.5)),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'COLOR: WHITE',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 190,
                      height: 60,
                      decoration: BoxDecoration(border: Border.all(width: 1.5)),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'COLOR: WHITE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                    ),
                    child: Container(
                      width: 370,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2), color: Colors.black),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ADD TO CART',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('\$',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            Text(
                              '899',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  'DECRIPTION',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18, right: 18),
                child: Text(
                  'Common Projects leather sneakers have gained cult status thanks to their minimalist design and superior construction. This white version is perfect for creating crisp city-smart looks.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 70,
                  width: 400,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 1))),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          'SIZE & FIT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //  Padding(
              // padding: const EdgeInsets.only(top: ),
              Container(
                height: 80,
                width: 400,
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey, width: 1))),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'DETAILS & CARES',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 400,
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey, width: 1))),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'MEN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 400,
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey, width: 1))),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'WOMEN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 400,
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey, width: 1))),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'OUTLET',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
