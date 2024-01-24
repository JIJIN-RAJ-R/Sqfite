import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
            
                child: Row(
                  
                  children: [
                    Image(
                      image: NetworkImage(
                          'https://sothebys-com.brightspotcdn.com/ba/63/5448ec3a43ad881557d41485631d/972sneakers-cfk7z-t3-01-1.jpg'),
                      height: 300,
                      width: 400,
                    ),
                    Image(
                      image: NetworkImage(
                          'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1691697272-image.png?crop=1xw:1.00xh;center,top&resize=980:*'),
                      height: 300,
                      width: 400,
                    ),
                    Image(
                      image: NetworkImage(
                          'https://crepdogcrew.com/cdn/shop/files/AirJordan1RetroHighOGSPNEXTCHAPTER_600x.png?v=1683613375'),
                      height: 300,
                      width: 400,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 180, top: 10, bottom: 20),
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
              const Text(
                'COMMON PROJECTS',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 8,
                ),
                child: Text(
                  'Original Achilles Leather Sneakers',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30, top: 8),
                child: Text('\$450',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Container(
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 18),
                    child: Container(
                      width: 390,
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
                            Text('\$410',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15))
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
