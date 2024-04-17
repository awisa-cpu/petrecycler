

typedef OnClose = bool Function();
typedef OnUpdate = bool Function(String text);

class LoadingController{

final OnClose close;
final OnUpdate update;

LoadingController({required this.close, required this.update});

}

