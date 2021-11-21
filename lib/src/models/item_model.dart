import 'dart:convert';

class ItemModel {
  String? by;
  int? descendants;
  int? id;
  List<int>? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;
  bool? deleted;
  bool? dead;
  String? text;

  ItemModel(
      {this.by,
        this.descendants,
        this.id,
        this.kids,
        this.score,
        this.time,
        this.title,
        this.type,
        this.url,
        this.deleted,
        this.dead,
        this.text});

  ItemModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    descendants = json['descendants'];
    id = json['id'];
    kids = json['kids']?.cast<int>();
    score = json['score'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
    deleted = json['deleted'];
    dead = json['dead'];
    text = json['text'];
  }

  ItemModel.fromDb(Map<String, dynamic> json) {
    by = json['by'];
    descendants = json['descendants'];
    id = json['id'];
    kids = jsonDecode(json['kids'])?.cast<int>();
    score = json['score'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
    /// if json['deleted'] == 1 then deleted = true, else false
    deleted = json['deleted'] == 1;
    dead = json['dead'] == 1;
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['descendants'] = this.descendants;
    data['id'] = this.id;
    data['kids'] = jsonEncode(this.kids);
    data['score'] = this.score;
    data['time'] = this.time;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    data['deleted'] = this.deleted;
    data['dead'] = this.dead;
    data['text'] = this.text;
    return data;
  }

  Map<String, dynamic> toDb() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['descendants'] = this.descendants;
    data['id'] = this.id;
    data['kids'] = jsonEncode(this.kids);
    data['score'] = this.score;
    data['time'] = this.time;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    data['deleted'] = this.deleted == true ? 1 : 0;
    data['dead'] = this.dead == true ? 1 : 0;
    data['text'] = this.text;
    return data;
  }
}
