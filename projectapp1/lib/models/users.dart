class User {
  final String email;
  final String photoUrl;
  final String username;
  final String bio;
  final String uid;
  final List followers;
  final List following;

  User(
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
}
