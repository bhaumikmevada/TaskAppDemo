
import '../models/ImagesModel.dart';

abstract class ImageListState{}

class ImageListInitState extends ImageListState{}

class ImageListLoadingState extends ImageListState{
  final List<Hits> oldLists;
  final bool isFirstFetch;
  ImageListLoadingState(this.oldLists,{this.isFirstFetch = false});

}

class ImageListResponseState extends ImageListState{
  List<Hits> list;
  ImageListResponseState(this.list);
}

class ImageListErrorState extends ImageListState{
  String error;
  ImageListErrorState(this.error);
}