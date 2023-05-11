enum LogoConstants {
  logoCream('logo_cream'),
  logoGreen('logo_green'),
  ;

  final String value;

  const LogoConstants(this.value);

  String get toPng => 'assets/logo/$value.png';
}
