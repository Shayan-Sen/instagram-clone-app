import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectapp1/models/users.dart';
import 'package:projectapp1/providers/user_provider.dart';
import 'package:projectapp1/resources/firestore_methods.dart';
import 'package:projectapp1/utils/colors.dart';
import 'package:projectapp1/widgets/comment_card.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key, required this.snap});
  final snap;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text('Comments'),
        centerTitle: false,
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: kToolbarHeight,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(users.photoUrl),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8.0),
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                      hintText: 'Comment as ${users.username}',
                      border: InputBorder.none),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await FirestoreMethods().postCommment(
                    widget.snap['postId'],
                    users.uid,
                    users.username,
                    users.photoUrl,
                    _commentController.text);
                setState(() {
                  _commentController.text = '';
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  'Post',
                  style: TextStyle(color: blueColor),
                ),
              ),
            )
          ],
        ),
      )),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(widget.snap['postId'])
            .collection('comments')
            .orderBy('datePublished', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          }
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => CommentCard(
              snap: (snapshot.data! as dynamic).docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
