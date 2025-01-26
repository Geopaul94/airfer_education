 
 
 
import 'dart:math';

String getRandomPrice() {
  Random random = Random();
  int randomPrice = 30 + random.nextInt(221); // Prices range from 30 to 250
  return '\$$randomPrice';
}
