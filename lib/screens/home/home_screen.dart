import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network_cubit/internet_cubit.dart';
import '../../network_cubit/internet_state.dart';
import '../../routes/RouteApp.dart';
import '../../utils/AppText.dart';
import '../../utils/ColorUtils.dart';
import 'cubit/image_list_cubit.dart';
import 'cubit/image_list_state.dart';
import 'models/ImagesModel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate crossAxisCount based on screen size
    int crossAxisCount;

    if (screenWidth < 600) {
      crossAxisCount = 2; // Mobile: 2 columns

    } else if (screenWidth < 1200) {
      crossAxisCount = 3; // Tablet: 3 columns

    } else {
      crossAxisCount = 4; // Desktop: 4 columns

    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InternetCubit(connectivity: Connectivity())),
        BlocProvider(create: (_) => ImageListCubit())
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          ),
          title: AppText.TextMedium("HomeScreen",18,ColorUtils.colorBlack),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<InternetCubit,InternetState>(
          builder: (context,state){

            if(state is InternetLoading){
              context.read<ImageListCubit>().getImagesList(context);
            }
            else if(state is InternetConnected){
              context.read<ImageListCubit>().getImagesList(context);
            }
            else if(state is InternetDisConnected){
             debugPrint("Internet Disconnected called");
            }


            return BlocBuilder<ImageListCubit,ImageListState>(
              builder: (context,states){

                List<Hits> stateList = [];
                bool isLoading = false;

                if(states is ImageListLoadingState){
                  stateList = states.oldLists;
                  isLoading = true;
                }else if(states is ImageListResponseState){
                  stateList = states.list;
                  isLoading = false;
                }

                if(stateList.isNotEmpty){

                  _scrollController.addListener(() {

                    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

                      context.read<ImageListCubit>().getImagesList(context);

                    }
                  });
                }

                return stateList.isEmpty ? isLoading == true ? const Center(
                  child: CircularProgressIndicator(),
                ) : Center(
                  child: Text(
                    "No Data Found",
                    style:  TextStyle(
                        color: ColorUtils.colorBlack,
                        fontSize: 18,
                        fontFamily: AppText.roboto,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ) :
                GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,

                      mainAxisSpacing: 10,

                  ),
                  itemCount: stateList.length + 1,
                  itemBuilder: (context,index){

                    if(index == stateList.length){

                      return Container(
                        child: Center(
                          child: isLoading == false  ?
                          AppText.TextBold("No Data Found", 16,ColorUtils.colorBlack) :
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }
                   else{
                      return GestureDetector(
                        onTap: (){
                          debugPrint("click image : ${stateList[index].largeImageURL}");

                          RouteApp.navigatedName(context, zoomImageRouteScreen, {
                            "url":stateList[index].largeImageURL.toString()
                          });

                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                            margin: EdgeInsets.all(10),
                            elevation: 5,

                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                Container(
                                    child: Expanded(
                                      child: SizedBox(
                                        width: double.infinity,

                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)
                                          ),
                                          child: Image.network(stateList[index].largeImageURL,
                                            fit: BoxFit.cover,),
                                        ),
                                      ),
                                    )
                                ),

                                const SizedBox(height: 10,),

                                Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.thumb_up_alt,color: Colors.blue,),
                                        const SizedBox(width: 5,),
                                        AppText.TextRegular("${stateList[index].likes} likes", 14, Colors.black87),

                                      ],
                                    )
                                ),

                                Container(
                                    margin: EdgeInsets.only(left: 8,top: 2),
                                    child: Row(
                                      children: [
                                        Icon(Icons.visibility,color: Colors.black38,size: 20,),
                                        const SizedBox(width: 5,),
                                        AppText.TextRegular("${stateList[index].views} views", 14, Colors.black87),
                                      ],
                                    )
                                ),

                                const SizedBox(height: 10,),

                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );

              },
            );
          },
        ),
      ),
    );
  }
}
