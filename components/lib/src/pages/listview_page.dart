import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listNumbers = [];
  int _lastItem = 0;
  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();

  // ciclo de vida
  @override
  void initState() {
    super.initState();
    _addTenImages();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_addTenImages();
        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[_createList(), _createLoading()],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getFirstPage,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listNumbers[index];
          return FadeInImage(
              placeholder: AssetImage('assets/animation_500_knnu94dj.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$image'),
              height: 300.0);
        },
      ),
    );
  }

  void _addTenImages() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }

    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    final _duration = new Duration(seconds: 2);
    return new Timer(_duration, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _addTenImages();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<Null> getFirstPage() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listNumbers.clear();
      _lastItem++;
      _addTenImages();
    });
    return Future.delayed(duration);
  }
}
