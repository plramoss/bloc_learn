import 'package:equatable/equatable.dart';

final class Post extends Equatable {
  const Post({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];
  /// props getter is a requirement when extending Equatable.
  /// This getter returns a list of properties that Equatable will use to determine object equality.
  /// In this case, id, title, and body are included, meaning two Post instances will be considered equal
  /// if all these fields match.
}