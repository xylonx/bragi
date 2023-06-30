import 'package:bragi/src/services/proto/bragi/bragi.pbgrpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BragiClientNotifer extends StateNotifier<BragiServiceClient?> {
  BragiClientNotifer(BragiServiceClient? client) : super(client);

  void changeBragiClient(BragiServiceClient client) {
    state = client;
  }
}

final bragiClientProvider =
    StateNotifierProvider<BragiClientNotifer, BragiServiceClient?>(
  (ref) => BragiClientNotifer(null),
);
