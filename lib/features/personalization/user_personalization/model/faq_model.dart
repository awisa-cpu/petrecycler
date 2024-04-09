class FaqModel {
  String title;
  String body;
  bool expand;

  //con
  FaqModel({
    required this.title,
    required this.body,
    this.expand = false,
  });
}