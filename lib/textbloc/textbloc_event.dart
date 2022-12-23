abstract class TextblocEvent {}

class InitEvent extends TextblocEvent {}
class getdata extends TextblocEvent{
  String str;
  getdata(this.str);
}