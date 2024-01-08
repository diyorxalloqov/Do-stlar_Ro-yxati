import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friends_list/view_model/bloc/friends_bloc.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Do'stlarim"),
      ),
      body: BlocBuilder<FriendsBloc, FriendsState>(
          builder: (context, state) => state.friends.isEmpty
              ? const Center(
                  child: Text("Do'stlar mavjud emas"),
                )
              : ListView.builder(
                  itemCount: state.friends.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemBuilder: (context, index) => Card(
                        child: ListTile(
                          title: Text(state.friends[index].name.toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "age ${state.friends[index].age.toString()}"),
                              Text(state.friends[index].description.toString()),
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                context.read<FriendsBloc>().add(
                                    FriendsDeleteEvent(
                                        id: state.friends[index].id ?? 0));
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                      ))),
    );
  }
}
