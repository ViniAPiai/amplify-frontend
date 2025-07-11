
// ignore_for_file: constant_identifier_names
enum ToothCode {
  T_11, T_12, T_13, T_14, T_15, T_16, T_17, T_18,
  T_21, T_22, T_23, T_24, T_25, T_26, T_27, T_28,
  T_31, T_32, T_33, T_34, T_35, T_36, T_37, T_38,
  T_41, T_42, T_43, T_44, T_45, T_46, T_47, T_48,
  T_51, T_52, T_53, T_54, T_55, T_61, T_62, T_63,
  T_64, T_65, T_71, T_72, T_73, T_74, T_75, T_81,
  T_82, T_83, T_84, T_85;

  String toUpperCase() => name.toUpperCase();

  int toInt() => int.parse(name.split("_")[1]);

  static ToothCode fromString(String code) {
    final normalized = code.toUpperCase();
    return ToothCode.values.firstWhere(
          (e) => e.name == normalized,
      orElse: () => throw ArgumentError('Código de dente inválido: $code'),
    );
  }
}