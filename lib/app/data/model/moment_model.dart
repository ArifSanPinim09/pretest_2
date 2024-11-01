import 'package:cloud_firestore/cloud_firestore.dart';

class MomentModel {
  final String id;
  final String userId;
  final String username;
  final String title;
  final String content;
  final DateTime? createdAt;

  MomentModel({
    required this.id,
    required this.userId,
    required this.username,
    required this.title,
    required this.content,
    this.createdAt,
  });

  factory MomentModel.fromFirestore(Map<String, dynamic> data, String id) {
    return MomentModel(
      id: id,
      userId: data['userId'] ?? '',
      username: data['username'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'username': username,
      'title': title,
      'content': content,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}
