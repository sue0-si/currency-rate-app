import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_viewModel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

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
              controller: _fromController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '기준 통화 금액',
              ),
              onChanged: (value) async {
                viewModel.baseAmount = value;
                await viewModel.exchangeCurrency(
                    true,
                    value,
                    viewModel.targetAmount,
                    viewModel.baseCurrency,
                    viewModel.targetCurrency);
                _toController.text = viewModel.resultText;
              },
            ),
            // 기준 통화 드롭다운 목록
            DropdownButton<String>(
              value: viewModel.baseCurrency,
              onChanged: (value) async {
                viewModel.baseCurrency = value!;
                await viewModel.exchangeCurrency(false, viewModel.baseAmount,
                    _toController.text, value, viewModel.targetCurrency);
                _fromController.text = viewModel.resultText;
              },
              items: const [
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
              controller: _toController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '대상 통화 금액',
              ),
              onChanged: (value) async {
                viewModel.targetAmount = value;
                await viewModel.exchangeCurrency(false, viewModel.baseAmount,
                    value, viewModel.baseCurrency, viewModel.targetCurrency);
                _fromController.text = viewModel.resultText;
              },
            ),
            // 대상 통화 드롭다운 목록
            DropdownButton<String>(
              value: viewModel.targetCurrency,
              onChanged: (value) async {
                viewModel.targetCurrency = value!;
                await viewModel.exchangeCurrency(true, _fromController.text,
                    viewModel.targetAmount, viewModel.baseCurrency, value);
                _toController.text = viewModel.resultText;
              },
              items: const [
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
