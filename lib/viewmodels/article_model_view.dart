import 'package:flutter/material.dart';
import 'package:myapp/models/article_model.dart';

class ArticleViewModel extends ChangeNotifier {
  List<ArticleModel> _list = [];

  List<ArticleModel> get list => _list;

  
}