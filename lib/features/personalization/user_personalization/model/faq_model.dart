class FaqModel {
  String title;
  String body;
  bool isExpanded;

  //con
  FaqModel({
    required this.title,
    required this.body,
    this.isExpanded = false,
  });

  factory FaqModel.empty()=>FaqModel(title: '', body: '',isExpanded: false);
}
