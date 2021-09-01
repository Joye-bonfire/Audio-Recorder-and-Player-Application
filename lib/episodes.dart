import 'package:firebase_database/firebase_database.dart';

class Episodes {
  String userid;
  String url;
  String flag;
  String language;
  String id;
  Episodes({
    this.id,
    this.userid,
    this.url,
    this.flag,
    this.language,
  });

  Episodes.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key,
        url = snapshot.value["url"],
        userid = snapshot.value["userid"],
        flag = snapshot.value["flag"],
        language = snapshot.value["language"];

  toJson() {
    return {"url": url, "flag": flag, "userid": userid, "language": language};
  }
}
