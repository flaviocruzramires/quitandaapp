import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class PedidoStatusWidget extends StatelessWidget {
  PedidoStatusWidget({
    super.key,
    required this.status,
    required this.qrdcodevenceu,
  });

  final String status;
  final bool qrdcodevenceu;

  final Map<String, int> statusConfig = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => statusConfig[status]!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 5, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _StatusDot(
            status: 'Pedido Confirmado',
            isActive: true,
            backgroundColor: Colors.green,
          ),
          const _CustomDivider(),
          if (currentStatus == 1) ...[
            const _StatusDot(
              status: 'Pix estornado',
              isActive: true,
              backgroundColor: Colors.orange,
            ),
            const _CustomDivider(),
          ],
          _StatusDot(
            status: 'Pago',
            isActive: currentStatus >= 2,
            backgroundColor: Colors.green,
          ),
          const _CustomDivider(),
          _StatusDot(
            status: 'Em preparação',
            isActive: currentStatus >= 3,
            backgroundColor: Colors.green,
          ),
          const _CustomDivider(),
          _StatusDot(
            status: 'Saiu p/ Entrega',
            isActive: currentStatus >= 4,
            backgroundColor: Colors.green,
          ),
          const _CustomDivider(),
          _StatusDot(
            status: 'Entregue',
            isActive: currentStatus >= 5,
            backgroundColor: Colors.green,
          ),
          const _CustomDivider(),
        ],
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({
    super.key,
    required this.status,
    required this.isActive,
    this.backgroundColor,
  });

  final String status;
  final bool isActive;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
            ),
            color: isActive
                ? backgroundColor ?? CustomColors.customSwatchColor
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox(),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            status,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}
