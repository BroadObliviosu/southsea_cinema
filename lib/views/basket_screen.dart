import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() {
    return _BasketScreenState();
  }
}

class _BasketScreenState extends State<BasketScreen> {
  String _confirmationMessage = '';

  final double _serviceCharge = 4.00;

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        child: Text(
          'Your basket is empty.',
          style: TextStyle(
            color: cinemaFontWhite,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildLineItem(
    BasketRepository basket,
    BasketItem item,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '${item.quantity} Tickets',
              style: const TextStyle(
                color: cinemaFontWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item.quantity} Standard'),
                const SizedBox(height: 4),
                Text(item.movie.title),
                const SizedBox(height: 4),
                Text(item.movie.screeningTime),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '£${item.lineTotal.toStringAsFixed(2)}',
              textAlign: TextAlign.end,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete_outline,
              color: cinemaFontWhite,
            ),
            onPressed: () {
              setState(() {
                basket.removeItem(index);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(
    String label,
    String value, {
    bool emphasise = false,
  }) {
    final TextStyle style;

    if (emphasise) {
      style = const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
    } else {
      style = const TextStyle(
        color: cinemaFontWhite,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }

  Widget _buildBasketList(
    BasketRepository basket,
    List<BasketItem> items,
  ) {
    final List<Widget> children = [];

    children.add(
      const Text(
        'MY ORDER',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    children.add(const SizedBox(height: 24));

    children.add(
      const Row(
        children: [
          Expanded(flex: 2, child: Text('Item')),
          Expanded(flex: 4, child: Text('Details')),
          Expanded(flex: 1, child: Text('Price', textAlign: TextAlign.end)),
          SizedBox(width: 48),
        ],
      ),
    );

    children.add(const SizedBox(height: 12));

    for (int index = 0; index < items.length; index++) {
      final BasketItem item = items[index];
      children.add(_buildLineItem(basket, item, index));
    }

    children.add(const SizedBox(height: 24));

    children.add(
      _buildTotalRow(
        'Service Charge',
        '£${_serviceCharge.toStringAsFixed(2)}',
      ),
    );

    children.add(
      _buildTotalRow(
        'Total Due',
        '£${(basket.getTotal() + _serviceCharge).toStringAsFixed(2)}',
        emphasise: true,
      ),
    );

    children.add(const SizedBox(height: 24));

    children.add(
      Row(
        children: [
          Expanded(
            child: PrimaryButton(
              label: 'UPDATE ORDER',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: PrimaryButton(
              label: 'BUY TICKETS',
              onPressed: () {
                setState(() {
                  basket.clear();
                  _confirmationMessage =
                      'Thank you for your ticket purchase!';
                });
              },
            ),
          ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    final BasketRepository basket = BasketRepository.instance;
    final List<BasketItem> basketItems = basket.getItems();
    final Widget content;

    if (basketItems.isEmpty) {
      if (_confirmationMessage.isNotEmpty) {
        content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmptyState(),
            const SizedBox(height: 12),
            Text(
              _confirmationMessage,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        );
      } else {
        content = _buildEmptyState();
      }
    } else {
      content = _buildBasketList(basket, basketItems);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),
    );
  }
}