import 'package:flutter/material.dart';
import 'package:myapp/helper/responsive_helper.dart';
import 'package:myapp/models/article_model.dart';
import 'package:myapp/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> _articles = [];

  @override
  void initState() {
    _fetchArticles();
    super.initState();
  }
  _fetchArticles() async {
    List<ArticleModel> articles = await APIService().fetchArticlesBySection('technology');
    setState(() {
      _articles = articles;
    });
  }

  _buildArticlesGrid(MediaQueryData mediaQuery) {
    List<GridTile> tiles = [];
    int index = 0;
    _articles.forEach((article) {
      index++;
      tiles.add(_buildArticlesTile(article, mediaQuery, index));
    });
    return Padding(
      padding: responsivePadding(mediaQuery),
      child: GridView.count(
        crossAxisCount: responsiveNumGridTiles(mediaQuery),
        mainAxisSpacing: 30,
        crossAxisSpacing: 30,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: tiles,
      ),
    );
  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _buildArticlesTile(ArticleModel article, MediaQueryData mediaQuery, int index) {
    return GridTile(
      child: GestureDetector(
        onTap: () => _launchURL(article.url),
        child: Column(
          children: [
            // photo
            Container(
              height: responsiveImageHeight(mediaQuery),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    article.multimedia != null
                      ? article.multimedia[0].url
                      : "https://static01.nyt.com/images/2020/07/19/business/00airbnb1/merlin_173400378_c8e2a75e-fc10-4a7b-83e3-0a448fe486e1-superJumbo.jpg"
                  ),
                  fit: BoxFit.cover
                )
              ),
            ),
            // title
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              height: responsiveTitleHeight(mediaQuery),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 1),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Text(
                article.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 80,),
          Center(
            child: Text(
              "Centre News\nTop Tech Articles",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5
              ),
            ),
          ),
          SizedBox(height: 15,),
          _articles.length > 0
            ? _buildArticlesGrid(mediaQuery)
            : Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}