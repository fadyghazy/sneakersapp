
import 'package:flutter/material.dart';
import 'package:sneakers_store/screens/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:SearchViewBody()
      )
    );
  }
}
