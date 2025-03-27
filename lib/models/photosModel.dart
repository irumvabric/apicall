class Photo {
  String? title;
  String? url;

  Photo({this.title, this.url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(title: json['title'], url: json['url']);
  }
}
