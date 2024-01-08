part of 'friends_bloc.dart';

@immutable
sealed class FriendsEvent extends Equatable {
  const FriendsEvent();
}

class FriendsGetEvent extends FriendsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FriendsCreateEvent extends FriendsEvent {
  final FriendsModel friendsCreate;

  const FriendsCreateEvent({required this.friendsCreate});

  @override
  // TODO: implement props
  List<Object?> get props => [friendsCreate];
}

class FriendsUpdateEvent extends FriendsEvent {
  final FriendsModel taskmodelnew;

  const FriendsUpdateEvent({required this.taskmodelnew});

  @override
  // TODO: implement props
  List<Object?> get props => [taskmodelnew];
}

class FriendsDeleteEvent extends FriendsEvent {
  final int id;

  const FriendsDeleteEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
