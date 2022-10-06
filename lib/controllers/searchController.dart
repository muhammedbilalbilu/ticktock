import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/models/user.dart';

class SearchController extends GetxController {
  final Rx<List<User>> _searcheduser = Rx<List<User>>([]);
  List<User> get searcheduser => _searcheduser.value;

  searchUser(String typedUser) async {
    _searcheduser.bindStream(firestore
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: typedUser)
        .snapshots()
        .map((QuerySnapshot query) {
      List<User> reVal = [];
      for (var elem in query.docs) {
        reVal..add(User.fromSnap(elem));
      }
      return reVal;
    }));
  }
}
