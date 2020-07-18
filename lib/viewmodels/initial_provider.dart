import 'package:myapp/viewmodels/article_model_view.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider<ArticleViewModel>(create: (ctx) => ArticleViewModel()),
];