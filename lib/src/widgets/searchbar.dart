import 'dart:async';

import 'package:bragi/src/providers/bragi.dart';
import 'package:bragi/src/services/proto/bragi/bragi.pbenum.dart' as BragiEnum;
import 'package:bragi/src/services/proto/bragi/bragi.pbgrpc.dart';
import 'package:bragi/src/widgets/text/provider_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchBar extends ConsumerWidget {
  SearchBar({
    super.key,
    Duration debounceDuration = const Duration(milliseconds: 500),
    required this.onSuggestionSelected,
  }) : _debounceDuration = debounceDuration;

  final Function(String) onSuggestionSelected;
  final Duration _debounceDuration;

  final TextEditingController textEditingController = TextEditingController();

  Future<List<SuggestReplay_Suggestion>> handleTextChange(
    String query,
    BragiClient? client,
  ) async {
    // TODO(xylonx): Maybe decouple suggest call to a single service to support local
    SuggestReplay? resp = await client?.suggest(SuggestRequest(
      providers: [BragiEnum.Provider.PROVIDER_BILIBILI],
      keyword: query,
    ));
    return resp?.suggestions ?? [];
  }

  void handleSubmit(String keyword) {
    textEditingController.text = keyword;
    onSuggestionSelected(keyword);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BragiClient? client = ref.watch(bragiClientProvider);
    return TypeAheadFormField(
      debounceDuration: _debounceDuration,
      textFieldConfiguration: TextFieldConfiguration(
        controller: textEditingController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(width: 2),
          ),
        ),
        onSubmitted: handleSubmit,
      ),
      suggestionsCallback: (pattern) => handleTextChange(pattern, client),
      itemBuilder: (context, suggestion) => Padding(
        padding: const EdgeInsets.all(8),
        child: ProviderIconText(
          provider: suggestion.provider,
          text: Text(suggestion.suggestion),
        ),
      ),
      onSuggestionSelected: (suggestion) => handleSubmit(suggestion.suggestion),
    );
  }
}
