import 'dart:async';

class Cake {}
class Order {
  String type;
  Order(this.type);
}

void main() {
  // StreamController coming from dart async package 
  final controller = new StreamController();
  
  final order = Order('chocolate');
  
  final baker =  new StreamTransformer.fromHandlers(
    handleData: (cakeType, sink) {
      if (cakeType == 'chocolate') {
        sink.add(new Cake());
      } else {
        sink.addError('I cannot bake that cake!!');
      }
    }
  );
  
  controller.sink.add(order);
  
  // factory
  controller.stream
    .map((order) => order.type) // just extracts the type and returns it
    .transform(baker) // used to run action on the data 
    .listen(
      (cake) => print('Here is your cake $cake'),
      onError: (err) => print(err)
  );
}
