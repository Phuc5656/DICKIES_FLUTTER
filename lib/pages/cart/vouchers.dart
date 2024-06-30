import 'package:flutter/material.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  final List<Voucher> discountVouchers = [
    Voucher('GIẢM 10%', '10/08/24', 'assets/images/logo.png', false),
    Voucher('GIẢM 20%', '10/08/24', 'assets/images/logo.png', false),
    Voucher('GIẢM 15%', '10/08/24', 'assets/images/logo.png', false),
  ];

  final List<Voucher> freeshipVouchers = [
    Voucher('MIỄN PHÍ GIAO HÀNG', '10/08/24', 'assets/images/logo.png', false),
  ];

  int selectedVouchers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khuyến mãi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MÃ GIẢM GIÁ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'BeVietnamPro',
              ),
            ),
            _buildVoucherList(discountVouchers),
            const SizedBox(height: 16.0),
            const Text(
              'MÃ MIỄN PHÍ GIAO HÀNG',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'BeVietnamPro',
              ),
            ),
            _buildVoucherList(freeshipVouchers),
            const Spacer(),
            Text('bạn đã chọn $selectedVouchers mã giảm giá'),
            ElevatedButton(
              onPressed: () {
                // Handle voucher acceptance
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF11456E),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text(
                'HOÀN TẤT',
                style: TextStyle(color: Colors.white),
              ), 
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoucherList(List<Voucher> vouchers) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vouchers.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 5,
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF1E3A5A), // Dark blue color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  vouchers[index].imagePath,
                  width: 60,
                  height: 60,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all( 14.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF4B400), // Yellow color
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      vouchers[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'NGÀY: ${vouchers[index].expiryDate}',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: _buildCustomCheckbox(vouchers[index]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomCheckbox(Voucher voucher) {
    return GestureDetector(
      onTap: () {
        setState(() {
          voucher.isSelected = !voucher.isSelected;
          selectedVouchers = (discountVouchers + freeshipVouchers)
              .where((voucher) => voucher.isSelected)
              .length;
        });
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: voucher.isSelected ? const Color(0xFF11456E) : Colors.white,
          border: Border.all(
            color: const Color(0xFF11456E),
            width: 2,
          ),
        ),
        child: voucher.isSelected
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}

class Voucher {
  String title;
  String expiryDate;
  String imagePath;
  bool isSelected;

  Voucher(this.title, this.expiryDate, this.imagePath, this.isSelected);
}

void main() {
  runApp(const MaterialApp(
    home: VoucherPage(),
  ));
}
