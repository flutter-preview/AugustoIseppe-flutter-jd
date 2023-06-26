/* revisado *//* revisado */
// ignore_for_file: prefer_final_fields, unused_field

class Post {
  int _userId;
  int _id;
  String _title;
  String _body;

  Post(this._userId, this._id, this._title, this._body);

  String get body => _body;

  set body(String value) {
    _body = value;
  }

  String get title => _title;

  set title (String value) {
    _title = value;
  }
}