// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_news_app2/screens/all_functions.dart';

// class ReadNewsContainer extends StatelessWidget {
//   ReadNewsContainer(
//       {Key? key, required this.image, required this.author, required this.date})
//       : super(key: key);
//   String image;
//   String author;
//   String date;

//   AllFunction _allFunction = AllFunction();
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           //padding: const EdgeInsets.all(17),
//           height: 260,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             color: Colors.black,
//           ),
//           child: image == null
//               ? Container()
//               : CachedNetworkImage(
//                   imageUrl: image,
//                   fit: BoxFit.cover,
//                 ),
//           clipBehavior: Clip.hardEdge,
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           top: 0,
//           bottom: 0,
//           child: Align(
//             alignment: Alignment.center,
//             child: Container(
//               height: 260,
//               width: double.infinity,
//               color: Colors.black.withOpacity(0.4),
//             ),
//           ),
//         ),
//         Positioned(
//             left: 5,
//             right: 5,
//             top: 5,
//             bottom: 5,
//             child: Align(
//               alignment: Alignment.center,
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     height: 65,
//                     width: MediaQuery.of(context).size.width,
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                             onTap: () => Navigator.pop(context),
//                             child: Container(
//                               height: 60,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Icon(
//                                 Icons.arrow_back_ios,
//                                 color: Colors.white,
//                               ),
//                             )),
//                         const Spacer(),
//                         GestureDetector(
//                             child: Container(
//                                 height: 60,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Center(
//                                   child: GestureDetector(
//                                     onTap: (() {
//                                       _allFunction.addToBookmark();
//                                     }),
//                                     child: Icon(
//                                       Icons.bookmark_add_outlined,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ))),
//                       ],
//                     ),
//                   ),
//                   const Spacer(),
//                   Container(
//                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                       height: 90,
//                       width: MediaQuery.of(context).size.width,
//                       child: Row(
//                         children: [
//                           const Spacer(),
//                           Container(
//                             padding: const EdgeInsets.all(12),
//                             constraints: BoxConstraints(
//                               maxHeight: 75,
//                               maxWidth: 270,
//                             ),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(author,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold)),
//                                 const SizedBox(
//                                   height: 8,
//                                 ),
//                                 Text(
//                                   date,
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )),
//                 ],
//               ),
//             ))
//       ],
//     );
//   }
// }
