int hexToInteger(String hex) => int.parse(hex, radix: 16);

extension StringExtension on String {
    String capitalizeFirstLetter() {
      return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
    }
}