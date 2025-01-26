import 'dart:math';

List<String> dresscode = [
  'T-shirt', 'denim', 'jeans', 'hoody', 'Polo', 'classic',
  'formal', 'casual', 'sportswear', 'loungewear', 'swimwear',
  'western', 'traditional', 'business', 'smart casual', 'activewear'
];

String getRandomDressCode() {
  Random random = Random();
  int index = random.nextInt(dresscode.length);
  return dresscode[index];
}