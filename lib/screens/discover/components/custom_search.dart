import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  List<String> books = [
    'Emile Zola',
    'The Fatal Tree',
    'Fatherhood',
    'Day Four',
    'Time & Space',
    'Land of Paper',
    'Tattletale',
    'Door to door',
    'The queen of hearts',
    'Set for life',
    'War on the gothic line',
    'Adrennes 1944',
    'The heart of hell'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var element in books) {
      if (element.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) => ListTile(title: Text(matchQuery[index])),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var element in books) {
      if (element.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => ListTile(title: Text(matchQuery[index])),
    );
  }
}
