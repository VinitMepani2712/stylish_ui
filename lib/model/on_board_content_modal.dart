class OnBoradingContentModel {
  String image;
  String title;
  String description;

  OnBoradingContentModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoradingContentModel> onBoradingContentModel = [
  OnBoradingContentModel(
      image: "assets/images/on_board_images/on_board_image_1.png",
      title: "Choose Products",
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
  OnBoradingContentModel(
      image: "assets/images/on_board_images/on_board_image_2.png",
      title: "Make Payment",
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
  OnBoradingContentModel(
      image: "assets/images/on_board_images/on_board_image_3.png",
      title: "Get Your Order",
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
];
