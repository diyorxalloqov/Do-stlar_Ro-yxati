part of 'friends_bloc.dart';

@immutable
class FriendsState extends Equatable {
  final List<FriendsModel> friends;
  final String error;
  final ActionStatus status;

  const FriendsState({
    this.friends = const [],
    this.error = '',
    this.status = ActionStatus.initial,
  });

  FriendsState copyWith(
      {List<FriendsModel>? friends, ActionStatus? status, String? error}) {
    return FriendsState(
      error: error ?? this.error,
      friends: friends ?? this.friends,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, error, friends];
}
