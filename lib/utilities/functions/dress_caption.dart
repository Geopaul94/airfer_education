import 'dart:math';

List<String> dressCaptions = [
  'Kings only', 'Be a man, Be brave', 'Ultra legend',
  'Never give up', 'Stay cool', 'Go for it', 'Just do it',
  'Feel good', 'Be yourself', 'Rock on', 'Stay wild'
];

String getRandomDressCaption() {
  Random random = Random();
  int index = random.nextInt(dressCaptions.length);
  return dressCaptions[index];
}
