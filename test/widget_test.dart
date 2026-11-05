import 'package:flutter_test/flutter_test.dart';
import 'package:katalog_oleh_oleh/main.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('Membuka detail produk dari katalog', (tester) async {
    await tester.pumpWidget(const KatalogApp());
    expect(find.text('Kopi Sidikalang'), findsOneWidget);

    await tester.tap(find.text('Kopi Sidikalang'));
    await tester.pumpAndSettle();

    expect(find.text('Minuman'), findsOneWidget); // Chip di halaman detail
    expect(find.byType(BackButton), findsOneWidget);

    // Setiap cabang mengingat tumpukannya: detail masih terbuka setelah
    // berpindah ke tab Tentang lalu kembali ke tab Katalog.
    await tester.tap(find.text('Tentang'));
    await tester.pumpAndSettle();
    expect(find.text('Tentang Toko'), findsOneWidget);

    await tester.tap(find.text('Katalog'));
    await tester.pumpAndSettle();
    expect(find.text('Minuman'), findsOneWidget);
    expect(find.byType(BackButton), findsOneWidget);
  });
}
