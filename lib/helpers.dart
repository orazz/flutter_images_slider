class Helpers {
  static remainder<T>(T input, T source) {
    if (input is double && source is double) {
      final double result = input % source;
      return result < 0 ? source + result : result;
    } else if (input is int && source is int) {
      final int result = input % source;
      return result < 0 ? source + result : result;
    } else {
      return 0;
    }
  }

  static T getRealIndex<T>(T position, T base, T length) {
    if (position is double && base is double && length is double) {
      final double offset = position - base;
      return remainder(offset, length);
    } else if (position is int && base is int && length is int) {
      final int offset = position - base;
      return remainder(offset, length);
    } else {
      return 0 as T;
    }
  }
}
