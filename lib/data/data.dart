import 'package:flutter/material.dart';

class SliderModel {
  String imageUrl;
  String title;
  String description;
  SliderModel({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });

  String getImageulr() {
    return imageUrl;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel(
      imageUrl: 'assets/image1.png',
      title: "First page title",
      description: "Frist page description");
  slides.add(sliderModel);
  SliderModel sliderModel2 = new SliderModel(
      imageUrl: 'assets/image2.png',
      title: "Second page title",
      description: "Second page description");
  slides.add(sliderModel2);
  SliderModel sliderModel3 = new SliderModel(
      imageUrl: 'assets/image3.png',
      title: "Third page title",
      description: "Third page description");
  slides.add(sliderModel3);

  return slides;
}
