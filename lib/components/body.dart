// import 'dart:html';
// import 'dart:js';

// import 'package:a/components/category.dart';
// import 'package:a/constants.dart';
// import 'package:a/model/Product.dart';
// import 'package:a/provider/product_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// class Body extends StatefulWidget {
//   const Body({super.key});

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   var isGrid = false;
//   @override
//   Widget build(BuildContext context) {
//     final ds = Provider.of<ProductProvider>(context);
//     if (ds.list.isEmpty) {
//       ds.getList();
//     }
//     final List<ProductModel> data = ds.list;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               IconButton(
//                   icon: SvgPicture.asset("assets/icons/list.svg"),
//                   onPressed: () {}),
//               IconButton(
//                   icon: SvgPicture.asset("assets/icons/grid.svg"),
//                   onPressed: () {}),
//               Expanded(
//                 child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
//                     child: ListView.builder(
//                         itemCount: data.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Card(
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                   top: 32, bottom: 32, left: 16, right: 16),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Image.network(
//                                     data[index].image ?? "",
//                                     height: 56,
//                                     width: 56,
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         top: 32,
//                                         bottom: 32,
//                                         left: 16,
//                                         right: 16),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           //pp.list[index].title ?? "",
//                                           //show[index].title ?? "",
//                                           data[index].title ?? "",
//                                           overflow: TextOverflow.ellipsis,
//                                           style: const TextStyle(fontSize: 16),
//                                         ),
//                                         Text(
//                                           //pp.list[index].price.toString() ?? "",
//                                           data[index].price.toString(),
//                                           style: const TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.orange),
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         })),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// listView(List<ProductModel> data) {
//   ListView.builder(
//       itemCount: data.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Card(
//           child: Padding(
//             padding: EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.network(
//                   data[index].image ?? "",
//                   height: 56,
//                   width: 56,
//                 ),
//                 Padding(
//                   padding:
//                       EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         //pp.list[index].title ?? "",
//                         //show[index].title ?? "",
//                         data[index].title ?? "",
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                       Text(
//                         //pp.list[index].price.toString() ?? "",
//                         data[index].price.toString(),
//                         style:
//                             const TextStyle(fontSize: 20, color: Colors.orange),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       });
// }
import 'package:a/screen/detals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../model/Product.dart';
import '../provider/product_provider.dart';
import 'package:a/constants.dart';

import 'category.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ds = Provider.of<ProductProvider>(context);
    if (ds.list.isEmpty) {
      ds.getList();
    }
    List<ProductModel> data = ds.list;
    List<String> value = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Padding(
        //     padding: EdgeInsets.all(8),
        //     child: TextField(
        //       decoration: InputDecoration(hintText: 'Search...'),
        //       onChanged: (text) {
        //         text = text.toLowerCase();
        //         data = data.where((dt) {
        //           var title = dt.title;
        //           return value.contains(title);
        //         }).toList();
        //       },
        //     )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            IconButton(
                icon: SvgPicture.asset("assets/icons/list.svg"),
                onPressed: () {}),
            IconButton(
                icon: SvgPicture.asset("assets/icons/grid.svg"),
                onPressed: () {}),
          ]),
        ),
        Categories(),
        viewGrid(data),
      ],
    );
  }

  Expanded viewGrid(List<ProductModel> data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (BuildContext context, index) {
              final dt = data[index];
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.all(kDefaultPaddin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(kDefaultPaddin),
                        //height: 180,
                        //width: 160,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.network(dt.image ?? ""),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPaddin / 4),
                      child: Text(
                        dt.title ?? "",
                        style: TextStyle(color: kTextColor),
                      ),
                    ),
                    Text(
                      "\$${dt.price.toString()}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        product: dt,
                                      )));
                        },
                        child: Text("Add to cart"))
                  ],
                ),
              );
            }),
      ),
    );
  }
}

//   Column ItemCard(List<ProductModel> data, int index,BuildContext context) {
// }
