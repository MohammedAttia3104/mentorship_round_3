import 'package:flutter/material.dart';

class AutoComplete extends StatelessWidget {
  const AutoComplete({super.key});

  @override
  Widget build(BuildContext context) {
    ///Auto Complete Widget
    ///Used to provide suggestions as the user types into a text field.
    ///It displays a list of options that match the current input.
    /// Properties:
    /// - optionsBuilder: A function that returns a list of suggestions based on the current input.
    /// - onSelected: A callback function that is called when a suggestion is selected.
    /// - displayStringForOption: A function that converts an option to a string for display
    /// - fieldViewBuilder: A function that builds the text field for user input.
    /// - optionsViewBuilder: A function that builds the widget to display the list of suggestions.

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return <String>[
                    'apple',
                    'banana',
                    'grape',
                    'orange',
                    'pineapple',
                    'strawberry',
                  ].where((String option) {
                    return option.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    );
                  });
                },
                onSelected: (String selection) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You selected: $selection')),
                  );
                },
                displayStringForOption: (String option) => option,
                fieldViewBuilder:
                    (
                      BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted,
                    ) {
                      return TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Type to search fruits',
                        ),
                      );
                    },
                optionsViewBuilder:
                    (
                      BuildContext context,
                      AutocompleteOnSelected<String> onSelected,
                      Iterable<String> options,
                    ) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          child: Container(
                            width: 300,
                            color: Colors.white,
                            child: ListView.builder(
                              padding: EdgeInsets.all(8.0),
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final String option = options.elementAt(index);
                                return ListTile(
                                  title: Text(option),
                                  onTap: () {
                                    onSelected(option);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
