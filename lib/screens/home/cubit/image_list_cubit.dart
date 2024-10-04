import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api_service/DioService.dart';
import '../models/ImagesModel.dart';
import 'image_list_state.dart';

class ImageListCubit extends Cubit<ImageListState>{

  final _dioService =  DioService();
  List<Hits> list = [];
  int page = 1;

  ImageListCubit() : super(ImageListInitState());

  void getImagesList(BuildContext context) async{

    if(state is ImageListLoadingState) return;

    final currentState = state;
    var oldData = <Hits>[];

    if(currentState is ImageListResponseState){
      oldData = currentState.list;
    }

    emit(ImageListLoadingState(oldData,isFirstFetch: page == 1));

    final response = await _dioService.getImages(context,page);

    if(response.statusCode == 200){
      page++;
      final data = (state as ImageListLoadingState).oldLists;
      var newData = response.data["hits"] as List;
      var result = newData.map((e) => Hits.fromJson(e)).toList();

      data.addAll(result as Iterable<Hits>);
      emit(ImageListResponseState(data));
    }else{
      emit(ImageListErrorState("${response.statusMessage}"));
    }


  }
}