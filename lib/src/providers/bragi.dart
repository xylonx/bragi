import 'package:bragi/src/services/proto/bragi/bragi.pbgrpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BragiClientNotifer extends StateNotifier<BragiClient?> {
  BragiClientNotifer(BragiClient? client) : super(client);

  void changeBragiClient(BragiClient client) {
    state = client;
    
  }
}

final bragiClientProvider =
    StateNotifierProvider<BragiClientNotifer, BragiClient?>(
  (ref) => BragiClientNotifer(null),
);
