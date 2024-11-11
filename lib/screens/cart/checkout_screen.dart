import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedPaymentMethod = 0;
  int selectedAddress = 0;

  final List<Map<String, dynamic>> addresses = [
    {
      'name': 'Home',
      'address': '123 Main Street, Apt 4B',
      'city': 'New York, NY 10001',
      'isDefault': true,
    },
    {
      'name': 'Office',
      'address': '456 Business Ave, Suite 200',
      'city': 'New York, NY 10002',
      'isDefault': false,
    },
  ];

  final List<Map<String, dynamic>> paymentMethods = [
    {
      'name': 'Credit Card',
      'number': '**** **** **** 1234',
      'icon': Icons.credit_card,
      'isDefault': true,
    },
    {
      'name': 'PayPal',
      'number': 'john.doe@email.com',
      'icon': Icons.payment,
      'isDefault': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Delivery Address Section
                  _buildSectionTitle('Delivery Address'),
                  const SizedBox(height: 12),
                  ...addresses.asMap().entries.map((entry) {
                    final index = entry.key;
                    final address = entry.value;
                    return _buildAddressCard(index, address);
                  }),
                  _buildAddAddressButton(),
                  const SizedBox(height: 24),

                  // Payment Method Section
                  _buildSectionTitle('Payment Method'),
                  const SizedBox(height: 12),
                  ...paymentMethods.asMap().entries.map((entry) {
                    final index = entry.key;
                    final method = entry.value;
                    return _buildPaymentMethodCard(index, method);
                  }),
                  _buildAddPaymentButton(),
                  const SizedBox(height: 24),

                  // Order Summary Section
                  _buildSectionTitle('Order Summary'),
                  const SizedBox(height: 12),
                  _buildOrderSummaryCard(cart),
                ],
              ),
            ),
          ),
          _buildBottomBar(cart),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildAddressCard(int index, Map<String, dynamic> address) {
    return GestureDetector(
      onTap: () => setState(() => selectedAddress = index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selectedAddress == index
              ? Colors.blue.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selectedAddress == index ? Colors.blue : Colors.grey[200]!,
          ),
        ),
        child: Row(
          children: [
            Radio(
              value: index,
              groupValue: selectedAddress,
              onChanged: (value) => setState(() => selectedAddress = value!),
              activeColor: Colors.blue,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        address['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      if (address['isDefault'])
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Default',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address['address'],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    address['city'],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: () {
                // TODO: Implement edit address
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddAddressButton() {
    return TextButton.icon(
      onPressed: () {
        // TODO: Implement add address
      },
      icon: const Icon(Icons.add),
      label: const Text('Add New Address'),
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Widget _buildPaymentMethodCard(int index, Map<String, dynamic> method) {
    return GestureDetector(
      onTap: () => setState(() => selectedPaymentMethod = index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selectedPaymentMethod == index
              ? Colors.blue.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selectedPaymentMethod == index
                ? Colors.blue
                : Colors.grey[200]!,
          ),
        ),
        child: Row(
          children: [
            Radio(
              value: index,
              groupValue: selectedPaymentMethod,
              onChanged: (value) =>
                  setState(() => selectedPaymentMethod = value!),
              activeColor: Colors.blue,
            ),
            Icon(method['icon']),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        method['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      if (method['isDefault'])
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Default',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    method['number'],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddPaymentButton() {
    return TextButton.icon(
      onPressed: () {
        // TODO: Implement add payment method
      },
      icon: const Icon(Icons.add),
      label: const Text('Add Payment Method'),
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Widget _buildOrderSummaryCard(CartProvider cart) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _OrderSummaryRow(
              title: 'Subtotal',
              value: '\$${cart.totalAmount.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 8),
            _OrderSummaryRow(
              title: 'Delivery Fee',
              value: '\$${cart.deliveryFee.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 8),
            _OrderSummaryRow(
              title: 'Tax',
              value: '\$${cart.tax.toStringAsFixed(2)}',
            ),
            const Divider(height: 24),
            _OrderSummaryRow(
              title: 'Total',
              value: '\$${cart.finalTotal.toStringAsFixed(2)}',
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(CartProvider cart) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            _showOrderConfirmationDialog();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Pay \$${cart.finalTotal.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void _showOrderConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Order Confirmed'),
        content: const Text('Your order has been placed successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              final cart = Provider.of<CartProvider>(context, listen: false);
              cart.clear();
              Navigator.of(context).pop();
              // Retourner à l'écran principal
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _OrderSummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isTotal;

  const _OrderSummaryRow({
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.blue : Colors.black,
          ),
        ),
      ],
    );
  }
}
