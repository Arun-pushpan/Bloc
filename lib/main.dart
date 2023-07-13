import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getbloc/logic/card_bloc/card_bloc.dart';
import 'package:getbloc/logic/gallery_bloc/gallery_bloc.dart';
import 'package:getbloc/repo/card_image_repo.dart';
import 'package:getbloc/repo/gallery_repo.dart';
import 'package:getbloc/repo/user_repo.dart';
import 'package:getbloc/repo/user_repo_reach.dart';
import 'package:getbloc/ui/card/card.dart';
import 'package:getbloc/ui/gallery/gallery_profile.dart';
import 'package:getbloc/ui/home/home_page.dart';

import 'logic/home_bloc/home_bloc.dart';
import 'model/card_model.dart';
import 'model/usermodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GalleryBloc>(
          create: (BuildContext context) => GalleryBloc(CardRepo())
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const GalleryImage()
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           appBar: AppBar(title: const Text('The BloC App')),
//           body: blocBody()
//     );
//   }
//
//   Widget blocBody() {
//     return BlocProvider(
//       create: (context) => UserBloc(
//         UserRepository(),
//       )..add(LoadUserEvent()),
//       child: BlocBuilder<UserBloc, UserState>(
//         builder: (context, state) {
//           if (state is UserLoadingState) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (state is UserErrorState) {
//             return const Center(child:  Text("Error"));
//           }
//           if (state is UserLoadedState) {
//             List<UserModel> userList = state.users;
//             return ListView.builder(
//                 itemCount: userList.length,
//                 itemBuilder: (_, index) {
//                   return Padding(
//                     padding:
//                     const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                     child: Card(
//                         color: Theme.of(context).primaryColor,
//                         child: ListTile(
//                             title: Text(
//                               '${userList[index].firstName}  ${userList[index].lastName}',
//                               style: const TextStyle(color: Colors.white),
//                             ),
//
//                             subtitle: Text(
//                               '${userList[index].email}',
//                               style: const TextStyle(color: Colors.white),
//                             ),
//
//                             leading: CircleAvatar(
//                               backgroundImage: NetworkImage(
//                                   userList[index].avatar.toString()),
//                             ))),
//                   );
//                 });
//           }
//
//           return Container();
//         },
//       ),
//     );
//   }
// }
