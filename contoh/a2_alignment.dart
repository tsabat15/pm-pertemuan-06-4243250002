import 'package:material_ui/material_ui.dart';

// Contoh A.2: mengamati setiap nilai mainAxisAlignment dan overflow pada Row.
// Jalankan: flutter run -d chrome -t contoh/a2_alignment.dart
void main() => runApp(const MaterialApp(home: HalamanA2()));

class HalamanA2 extends StatefulWidget {
  const HalamanA2({super.key});
  @override
  State<HalamanA2> createState() => _HalamanA2State();
}

class _HalamanA2State extends State<HalamanA2> {
  MainAxisAlignment _rata = MainAxisAlignment.start;
  // Ubah ke true untuk melihat overflow, lalu false untuk versi yang diperbaiki.
  bool _teksPanjang = false;
  bool _pakaiExpanded = false;

  static const _teks =
      'Bika Ambon khas Medan dengan tekstur berongga dan rasa pandan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('A.2 mainAxisAlignment')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              children: [
                for (final m in MainAxisAlignment.values)
                  ChoiceChip(
                    label: Text(m.name),
                    selected: _rata == m,
                    onSelected: (_) => setState(() => _rata = m),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: _rata,
                children: const [
                  Icon(Icons.cake, size: 40),
                  Icon(Icons.local_cafe, size: 40),
                  Icon(Icons.cookie, size: 40),
                ],
              ),
            ),
            const Divider(height: 40),
            SwitchListTile(
              title: const Text('Teks panjang'),
              value: _teksPanjang,
              onChanged: (v) => setState(() => _teksPanjang = v),
            ),
            SwitchListTile(
              title: const Text('Bungkus dengan Expanded'),
              value: _pakaiExpanded,
              onChanged: (v) => setState(() => _pakaiExpanded = v),
            ),
            Row(
              children: [
                const Icon(Icons.cake, size: 40),
                const SizedBox(width: 8),
                if (_pakaiExpanded)
                  Expanded(child: Text(_teksPanjang ? _teks : 'Bika Ambon'))
                else
                  Text(_teksPanjang ? _teks : 'Bika Ambon'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
