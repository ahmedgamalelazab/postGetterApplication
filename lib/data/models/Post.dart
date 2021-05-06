class Posts {
  int _userId;
  int _id;
  String _title;
  String _body;

  Posts({int userId, int id, String title, String body}) {
    this._userId = userId;
    this._id = id;
    this._title = title;
    this._body = body;
  }

  int get userId => _userId;

  int get id => _id;

  String get title => _title;

  String get body => _body;

  Posts.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['id'] = this._id;
    data['title'] = this._title;
    data['body'] = this._body;
    return data;
  }
}
