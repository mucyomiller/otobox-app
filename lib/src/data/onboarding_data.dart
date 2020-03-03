import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "assets/images/logo.png",
      title: "",
      body: "",
      author: "",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "assets/images/logo.png",
      title: "",
      body: "",
      author: "",
      titleGradient: gradients[2]),
];

List<List<Color>> gradients = [
  [Color(0xFF9D1B39), Color(0xFF9D1B39)],
  [Color(0xFF18ACA1), Color(0xFF18ACA1)],
  [Color(0xFF11743B), Color(0xFF11743B)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  var author;
  List<Color> titleGradient = [];
  PageModel(
      {this.imageUrl, this.title, this.body, this.author, this.titleGradient});
}
