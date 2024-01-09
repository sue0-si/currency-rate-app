import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_viewModel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    void _updateTargetAmount() {
      setState(() {
        viewModel.exchangeCurrency(viewModel.baseCurrency);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('환율 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 기준 통화 금액 입력 필드
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '기준 통화 금액',
              ),
              onChanged: (value) {
                viewModel.baseAmount = double.parse(value);
              },
            ),
            // 기준 통화 드롭다운 목록
            DropdownButton<String>(
              value: viewModel.baseCurrency,
              onChanged: (value) {
                viewModel.baseCurrency = value!;
              },
              items: [
                DropdownMenuItem(
                  value: 'KRW',
                  child: Text('KRW'),
                ),
                DropdownMenuItem(
                  value: 'USD',
                  child: Text('USD'),
                ),
                DropdownMenuItem(
                  value: 'EUR',
                  child: Text('EUR'),
                ),
                DropdownMenuItem(
                  value: 'JPY',
                  child: Text('JPY'),
                ),
              ],
            ),
            // 대상 통화 금액 입력 필드
            TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '대상 통화 금액',
              ),
            ),
            // 대상 통화 드롭다운 목록
            DropdownButton<String>(
              value: viewModel.targetCurrency,
              onChanged: (value) {
                viewModel.targetCurrency = value!;
                _updateTargetAmount();
              },
              items: [
                DropdownMenuItem(
                  value: 'KRW',
                  child: Text('KRW'),
                ),
                DropdownMenuItem(
                  value: 'USD',
                  child: Text('USD'),
                ),
                DropdownMenuItem(
                  value: 'EUR',
                  child: Text('EUR'),
                ),
                DropdownMenuItem(
                  value: 'JPY',
                  child: Text('JPY'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
