import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_bloc/bloc/post_bloc.dart';
import 'package:task_bloc/bloc/post_event.dart';
import 'package:task_bloc/bloc/post_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final postsBloc = BlocProvider.of<PostsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          postsBloc.add(PostAddEvent());
        },
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        listener: (context, state) {
          if (state is PostsAdditionSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Post added successfully!')),
            );
          } else if (state is PostsAdditionErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to add post.')),
            );
          }
        },
        builder: (context, state) {
          if (state is PostsFetchingLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostFetchingSuccessfulState) {
            final successState = state;

            return ListView.builder(
              itemCount: successState.posts.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(successState.posts[index].title),
                      Text(successState.posts[index].body),
                    ],
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
