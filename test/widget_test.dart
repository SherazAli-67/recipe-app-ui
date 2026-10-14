import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app_ui/constants/string_const.dart';
import 'package:recipe_app_ui/main.dart';

void main() {
  testWidgets('Home screen loads inside navigation shell', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text(StringConst.userName), findsOneWidget);
    expect(find.text(StringConst.home), findsWidgets);
    expect(find.text(StringConst.recommendation), findsOneWidget);
  });
}
