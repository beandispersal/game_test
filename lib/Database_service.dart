import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lwk/UserData.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference dataCollection = Firestore.instance.collection('data');

  Future updateUserData(double money, int hunger, List history, List best, String username) async {
    return await dataCollection.document(uid).setData({
      'money': money ?? 0,
      'hunger': hunger ?? 0,
      'zhistory': history ?? [],
      'zbest': best ?? [],
      'username' : username ?? '',
    });
  }

  Stream<UserData> get userData{
    return dataCollection.document(uid).snapshots().map(_userDatafSnps);
  }

  UserData _userDatafSnps(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      hunger: snapshot.data['hunger'],
      money: snapshot.data['money'],
      zhistory: snapshot.data['zhistory'],
      zbest: snapshot.data['zbest'],
      username: snapshot.data['username'],
    );
  }
}