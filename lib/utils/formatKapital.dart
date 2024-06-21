String formatKapital(String text) {
  // convert first letter of each word to uppercase
  String result = text
      .toLowerCase()
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
  return result;
}
