import 'dart:math';

import 'package:blocEncrypt/criptor.dart';

const List<String> ALPHABET = [
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z"
];

List encryptWord = [];
List decryptWord = [];
bool isCriptor;
List currentKey;

criptor<String>(
  String string,
  int lengthData,
) {
  encryptWord.clear();
  print("Gronsveld Starts");
  int encryptStep;
  int decryptStep;

  var randomizer = new Random().nextInt(9);
  var keyList = List.generate(lengthData, (_) => randomizer);

  print("КЛЮЧ ГРОНСВЕЛЬДА $keyList");
  print("ИСХОДНАЯ СТРОКА $string");

  List word = string.toString().toLowerCase().split("");

  for (var i = 0; i < word.length; i++) {
    var step = int.parse(keyList[i].toString());

    switch (isCriptor) {
      case true:
        {
          encryptStep = ALPHABET.indexOf(word[i]) + step;
          if (encryptStep >= 26) {
            encryptWord
                .add(ALPHABET[step - 1 - (25 - ALPHABET.indexOf(word[i]))]);
          } else
            encryptWord.add(ALPHABET[encryptStep]);

          currentKey = keyList;
        }
        break;
      case false:
        {
          var rstep = int.parse(currentKey[i].toString());
          decryptStep = ALPHABET.indexOf(word[i]) - rstep;
          if (decryptStep < 0) {
            decryptWord.add(ALPHABET[26 + decryptStep]);
          } else {
            decryptWord.add(ALPHABET[decryptStep]);
          }
        }
        break;
    }
    print("КОНЕЧНАЯ СТРОКА ${encryptWord.join()}");
  }
  return encryptWord.join();
}
