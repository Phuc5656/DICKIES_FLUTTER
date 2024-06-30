import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.blue[900],
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                'THANH TOÁN HOÀN TẤT',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                   fontFamily: 'BeVietnamPro'
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'ID ĐƠN HÀNG: 123413131231',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ngày :'),
                  Text(
                    'Ngày 05 tháng 08, 2024',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                       fontFamily: 'BeVietnamPro'
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phương thức:'),
                  Text(
                    'Thẻ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                       fontFamily: 'BeVietnamPro'
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng tiền :'),
                  Text(
                    '\$104.96',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                       fontFamily: 'BeVietnamPro'
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                ),
                child: const Text(
                  'Hoàn tất',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                     fontFamily: 'BeVietnamPro'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}