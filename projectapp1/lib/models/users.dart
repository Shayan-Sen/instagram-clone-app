import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String email;
  final String photoUrl;
  final String username;
  final String bio;
  final String uid;
  final List followers;
  final List following;

  Users(
      {required this.email,
      required this.photoUrl,
      required this.username,
      required this.bio,
      required this.followers,
      required this.following,
      required this.uid});

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': followers,
        'following': following,
        'photoUrl': photoUrl
      };

  static Users fromSnap(DocumentSnapshot snap) {
    Map snapshot = snap.data() as Map<String, dynamic>;
    return Users(
        email: snapshot['email'],
        photoUrl: snapshot['photoUrl'],
        username: snapshot['username'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        uid: snapshot['uid']);
  }
}
