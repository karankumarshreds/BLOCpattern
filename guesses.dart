import 'dart:html';

void main() {
  final Element? button  = querySelector('button') as ButtonElement;
  final InputElement? input = querySelector('input') as InputElement;
  
  if (button != null && input != null) {
    button.onClick
    .take(4) // take/allow only 4 events (counter)
    .where((event) => input.value == 'banana')  // filter event 
    .listen(
      (event) {
        return print('You got it!'); // as soon as the condition is met
      },
      onDone: () => print('Nope, bad guesses!') // when counter reaches 4
    );
  }
    
}
