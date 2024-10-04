class ImagesModel {
  late int total;
  late int totalHits;
  late List<Hits> hits;

  ImagesModel({required this.total, required this.totalHits, required this.hits});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = <Hits>[];
      json['hits'].forEach((v) {
        hits.add(new Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['totalHits'] = this.totalHits;
    if (this.hits != null) {
      data['hits'] = this.hits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
 

class Hits {
  late int id;
  late String pageURL;
  late String type;
  late String tags;
  late String previewURL;
  late int previewWidth;
  late int previewHeight;
  late String webformatURL;
  late int webformatWidth;
  late int webformatHeight;
  late int imageHeight;
  late String largeImageURL;
  late int imageWidth;
  late int downloads;
  late int collections;
  late int likes;
  late int comments;
  late int userId;
  late String user;
  late String userImageURL;
  late int imageSize;
  late int views;

  Hits(
      {required this.id,
        required this.pageURL,
        required this.type,
        required this.tags,
        required this.previewURL,
        required this.previewWidth,
        required this.previewHeight,
        required this.webformatURL,
        required this.webformatWidth,
        required this.webformatHeight,
        required this.largeImageURL,
        required this.imageWidth,
        required this.imageHeight,
        required this.imageSize,
        required this.views,
        required this.downloads,
        required this.collections,
        required this.likes,
        required this.comments,
        required this.userId,
        required this.user,
        required this.userImageURL});

  Hits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    previewURL = json['previewURL'];
    previewWidth = json['previewWidth'];
    previewHeight = json['previewHeight'];
    webformatURL = json['webformatURL'];
    webformatWidth = json['webformatWidth'];
    webformatHeight = json['webformatHeight'];
    largeImageURL = json['largeImageURL'];
    imageWidth = json['imageWidth'];
    imageHeight = json['imageHeight'];
    imageSize = json['imageSize'];
    views = json['views'];
    downloads = json['downloads'];
    collections = json['collections'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pageURL'] = this.pageURL;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['previewURL'] = this.previewURL;
    data['previewWidth'] = this.previewWidth;
    data['previewHeight'] = this.previewHeight;
    data['webformatURL'] = this.webformatURL;
    data['webformatWidth'] = this.webformatWidth;
    data['webformatHeight'] = this.webformatHeight;
    data['largeImageURL'] = this.largeImageURL;
    data['imageWidth'] = this.imageWidth;
    data['imageHeight'] = this.imageHeight;
    data['imageSize'] = this.imageSize;
    data['views'] = this.views;
    data['downloads'] = this.downloads;
    data['collections'] = this.collections;
    data['likes'] = this.likes;
    data['comments'] = this.comments;
    data['user_id'] = this.userId;
    data['user'] = this.user;
    data['userImageURL'] = this.userImageURL;
    return data;
  }
}