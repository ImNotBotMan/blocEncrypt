import 'package:blocEncrypt/kriptor.dart';

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
List match = [];

///получаем результат шифровки text1 строка для шифрования text2 гамма строка
String getEncriptWord(String text1, String text2) {
  ///списки с индексами каждого слова
  var first = getIndex(text1);
  var second = getIndex(text2);

  for (var i = 0; i < first.length; i++) {
    ///складываем два индкса и вычитаем из результата длину алфавита
    var a = first[i] + second[i];
    var b = a - ALPHABET.length;

    ///если полученое число отрицательное, получаем его модуль
    if (b < 0) {
      b = -(b);
    }

    /// если всё ок, то вычитаем единицу
    if (b > 0) {
      b = b - 1;
    }

    ///добавляем в конечный список
    match.add(ALPHABET[b]);
    print(match);
  }
  isCriptor = true;
  String after2cript = criptor(match.join(), match.length);
  return after2cript;
}

/// Функция получения индексы из слова
List getIndex(String text) {
  List encryptIndex = [];
  List wordList = text.toString().toLowerCase().split("");
  wordList.forEach((element) {
    encryptIndex.add(ALPHABET.indexOf(element));
  });
  return encryptIndex;
}
