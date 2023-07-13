


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getbloc/logic/gallery_bloc/gallery_bloc.dart';
import 'package:getbloc/repo/card_image_repo.dart';
import 'package:getbloc/repo/gallery_repo.dart';
import 'package:getbloc/repo/user_repo_reach.dart';

class GalleryImage extends StatelessWidget {
  const GalleryImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: galleryBody()
      
    );
  }
  Widget galleryBody(){
    return BlocProvider(
        create:(context)=> GalleryBloc(CardRepo())..add(FetchGalleryEvent()),
        child: BlocBuilder<GalleryBloc,GalleryState>(
            builder: (context,state){
              if(state is GalleryLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if(state is GalleryErrorState){
                return  Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    color: Colors.cyan,
                    child: const Center(child: Text("Error in Loading")),

                  ),
                );
              }else if(state is GalleryLoadedState){
                final galleryLists =state.cardList;
                return ListView.builder(
                  itemCount: galleryLists.length,
                    itemBuilder: (state,index){
                      return  Padding(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                        child: Container(
                          height: 250,
                            width: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(galleryLists[index].imageUrl))
                          ),
                        ),

                      );
                    });
              }return Container();
            }),

    );
  }
}
