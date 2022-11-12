class OrderInfo {
  const OrderInfo({
    required this.id,
    required this.date,
    required this.driverInfo,
    required this.deliveryProcesses,
  });

  final int id;
  final DateTime date;
  final DriverInfo driverInfo;
  final List<DeliveryProcess> deliveryProcesses;
}

class DriverInfo {
  const DriverInfo({
    required this.name,
    required this.thumbnailUrl,
  });

  final String name;
  final String thumbnailUrl;
}

class DeliveryProcess {
  const DeliveryProcess(
    this.name,
    this.details, {
    this.messages = const [],
  });

  const DeliveryProcess.complete()
      : name = 'Done',
        details = 'details',
        messages = const [];

  final String name;
  final String details;
  final List<DeliveryMessage> messages;

  bool get isCompleted => name == 'Done';
}

class DeliveryMessage {
  const DeliveryMessage(this.createdAt, this.message);

  final String createdAt; // final DateTime createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}

dataList(int id) => OrderInfo(
      id: id,
      date: DateTime.now(),
      driverInfo: const DriverInfo(
        name: 'Philipe',
        thumbnailUrl:
            'https://i.pinimg.com/originals/08/45/81/084581e3155d339376bf1d0e17979dc6.jpg',
      ),
      deliveryProcesses: [
        const DeliveryProcess(
          'Order Confirmed',
          'Your order has been confirmd in FoodIn App.',
          messages: [
            DeliveryMessage('8:30am', 'Package received by driver'),
            DeliveryMessage('11:30am', 'Reached halfway mark'),
          ],
        ),
        const DeliveryProcess(
          'Product Packaging',
          "We prepared your order for delivery.",
          messages: [
            DeliveryMessage('13:00pm', 'Driver arrived at destination'),
            DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
          ],
        ),
        const DeliveryProcess(
          'Delivery in Progress',
          "Delivery man on the way, wait a few seconds to enjoy your delicious meal.",
          messages: [
            DeliveryMessage('13:00pm', 'Driver arrived at destination'),
            DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
          ],
        ),
        const DeliveryProcess(
          'Delivered Successfully',
          'Enjoy your delicious meal and stay with FoodIn.',
          messages: [
            DeliveryMessage('13:00pm', 'Driver arrived at destination'),
            DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
          ],
        ),
        const DeliveryProcess(
          'Rate Your Experience',
          'Rate us our services and enjoy FoodIn.',
          messages: [
            DeliveryMessage('13:00pm', 'Driver arrived at destination'),
            DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
          ],
        ),
        const DeliveryProcess.complete(),
      ],
    );