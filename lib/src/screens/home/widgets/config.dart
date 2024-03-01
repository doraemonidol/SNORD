import 'package:rehabox/src/models/NicontineConsumption/nicotine_consumption.dart';

const chartSvgString = '''
<svg width="18" height="19" viewBox="0 0 18 19" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 18.26H18V0.26H0V18.26Z" fill="#040415"/>
</svg>
''';

final mockData = [
  0.3,
  0.0,
  0.0,
  0.0,
  0.2,
  0.0,
  0.0,
  0.0,
  0.5,
  0.0,
  0.0,
  0.1,
  0.0,
  0.0,
  0.3,
  0.0,
  0.0,
  0.2,
  0.0,
  0.0,
  0.5,
  0.0,
  0.0,
  0.4
].map((e) => NicotineConsumption(metric: "mg", value: e)).toList();

final mockDataWeekly = [
  1.2,
  1.1,
  0.9,
  0.5,
  1.3,
  1.2,
  1.4,
].map((e) => NicotineConsumption(metric: "ml", value: e)).toList();

final mockDataMonth = [
  38.21,
  36.89,
  33.45,
  32.76,
  35.12,
  34.28,
  31.57,
  39.02,
  30.85,
  37.93,
  34.67,
  39.45,
  30.34,
  36.18,
  33.79,
  35.68,
  32.91,
  31.24,
  37.14,
  38.79,
  39.92,
  38.06,
  30.56,
  32.38,
  39.28,
  35.98,
  37.72,
  31.89,
  36.46,
  34.53,
].map((e) => NicotineConsumption(metric: "ml", value: e)).toList();
