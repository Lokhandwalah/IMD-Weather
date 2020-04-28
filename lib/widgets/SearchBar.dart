import 'package:flutter/material.dart';
import '../services/ApiCall.dart';
import '../values/MyTextStyles.dart';

class SearchBar extends SearchDelegate<String> {
  static List cities = [];
  static Map id = {};
  @override
  String get searchFieldLabel => 'Enter City';

  static getCities() async {
    CityData cityData = new CityData();
    await cityData.getIDs();
    cities = cityData.city;
    id = cityData.id;
  }

  List recentcities = [];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        primaryColor: theme.primaryColor,
        primaryIconTheme: theme.primaryIconTheme,
        primaryColorBrightness: theme.primaryColorBrightness,
        inputDecorationTheme:
            InputDecorationTheme(hintStyle: MyTextStyles.bodyTextwhite));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Found");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionList;
    bool flag = true;
    String msg;
    if (query.isEmpty) {
      flag = false;
      msg = "";
    } else {
      if (cities.isNotEmpty) {
        suggestionList = cities
            .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
        if (suggestionList.isEmpty) {
          flag = false;
          msg = "No Results \n Try searching a Major City";
        }
      } else {
        flag = false;
        msg = "No Internet :(";
      }
    }
    //print('from searchbar');

    return flag
        ? ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                print('tapped ${suggestionList[index]}');
                Navigator.pushNamed(context, '/station', arguments: {
                  "location": suggestionList[index],
                  "id": id[suggestionList[index]]
                });
                //showResults(context);
              },
              leading: Icon(Icons.location_city, color: Colors.white),
              title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: TextStyle(color: Colors.grey,))
                    ]),
                // title: Text("hello"),
              ),
            ),
            itemCount: suggestionList.length,
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                      msg,
                      style: MyTextStyles.bodyTextwhite,
                      textAlign: TextAlign.center,
          )),
                    ],
                  ),
                ],
              ),
            ));
  }
}
