// import 'dart:html';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:getbloc/repo/card_image_repo.dart';
//
// import '../../logic/card_bloc/card_bloc.dart';
// import '../../logic/card_bloc/card_state.dart';
// import '../../model/card_model.dart';
//
// // class CardImagess extends StatelessWidget {
// //   const CardImagess({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text("CardImage"),
// //         ),
// //         body: cardBuildBody()
// //     );
// //   }
// //   Widget cardBuildBody() {
// //     return BlocProvider(
// //         create: (context) => CardBloc(CardRepo())..add(FetchCardEvent()),
// //         child: BlocBuilder<CardBloc,CardState>(
// //             builder: (context, state){
// //               if(state is CardLoading){
// //                 return const Center(
// //                   child: CircularProgressIndicator(),
// //                 );
// //               }if(state is CardError){
// //                 return const Center(child:  Text("Error"));
// //               }if(state is CardLoadedState){
// //                 final cardList =state.cardImageList;
// //                 return  GridView.builder(
// //                     scrollDirection: Axis.vertical,
// //                     // shrinkWrap: true,
// //                     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
// //                         maxCrossAxisExtent: 400,
// //                         childAspectRatio: 3 / 2,
// //                         crossAxisSpacing: 6,
// //                         mainAxisSpacing: 6),
// //                     itemCount: cardList.length,
// //                     itemBuilder: (BuildContext ctx, index) {
// //                       return GestureDetector(
// //                         onTap: () async {
// //
// //                         },
// //                         child:
// //                         Container(
// //                           // height: 600,
// //                           // width: 500,
// //                           decoration: BoxDecoration(
// //                             // color: Colors.amber,
// //                               image: DecorationImage(
// //                                   image: NetworkImage(cardList[index].imageUrl),
// //                                   fit: BoxFit.cover),
// //                               borderRadius: BorderRadius.circular(15)),
// //                         ),
// //                       );
// //                     });
// //             }return Container();
// //             })
// //     );
// //   }
// //
// // }
//
// class CardImagess extends StatelessWidget {
//   const CardImagess({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("CardImage"),
//       ),
//       body: Center(
//         child: Container(
//           height: 250,
//           width: 250,
//           color: Colors.green,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: NetworkImage(""))
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           BlocProvider.of<CardBloc>(context).add(PickImageEvent());
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//
//
// // ...
// }
//
//
